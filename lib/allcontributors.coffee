{CompositeDisposable} = require 'atom'

module.exports = Allcontributors =
  allcontributorsView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @subscriptions = new CompositeDisposable
    # Register command that executes tranformation
    @subscriptions.add atom.commands.add 'atom-workspace', 'allcontributors:transform': => @transform()

  deactivate: ->
    @subscriptions.dispose()

  transform: ->
    emojiMap =
      code: "💻"
      utility: "🔌"
      tools: "🔧"
      infra: "🚇"
      doc: "📖"
      translation: "🌍"
      answers: "💁"
      tests: "⚠️"
      bug: "🐛"
      example: "💡"
      blogpost: "📝"
      tutorial: "✅"
      video: "📹"
      talks: "📢"
      design: "🎨"
      prReview: "👀"

    strList = ["<!-- Contributors START", "Contributors END -->", "<!-- Contributors table START -->", "<!-- Contributors table END -->"]

    findPoints = (textList) ->
      index = 0
      tempPoints = []
      matchStr = (strI, listI) ->
        if strList[strI] == textList[listI] and strI < 4
          tempPoints.push listI
          ++index
      matchStr index, itr for itr in [0..textList.length-1]
      tempPoints

    mapToStr = (repo, emojiKey, author) ->
      git = repo.getOriginURL()
      if git.substr(git.length-4,4) == ".git"
        git = git.substr(0, git.length-4)
      if emojiKey=="code" or emojiKey=="doc" or emojiKey=="tests"
        "[#{emojiMap[emojiKey]}](#{git}/commits?author=#{author})"
      else if emojiKey=="bug"
        "[#{emojiMap[emojiKey]}](#{git}/issues?q=author%3A#{author})"
      else
        "#{emojiMap[emojiKey]}"

    parseLine = (repo, line, num) ->
      entities = line.split(' ')
      name = entities[0].split('_').join(' ')
      strBuild = "| [![#{name}](https://avatars.githubusercontent.com/#{entities[1]}?s=100)<br /><sub>#{name}</sub>](#{entities[2]})<br />"
      strBuild += (mapToStr repo, entity, entities[1] for entity, i in entities when i>2).join(' ')
      if (num+1)%7 == 0
        strBuild += " |\n"
        strBuild += ("| :---: " for values in [7..1]).join('')
        strBuild += '|\n\n'
      else
        strBuild += " "
      strBuild

    runParser = (repo) ->
      if repo != null
        points = findPoints docText
        contriBufferArray = editor.getTextInBufferRange([[points[0]+1, 0], [points[1]-1, docText[points[1]-1].length]]).split('\n')
        contriLen = contriBufferArray.length
        totalContri = (parseLine repo, line, num for line, num in contriBufferArray).join('')
        if contriLen%7 != 0
          totalContri += "|\n"
          totalContri += ("| :---: " for num in [contriLen%7..1]).join('')
          totalContri += '|\n'
        editor.setTextInBufferRange([[points[2]+1, 0], [points[3], 0]], totalContri)

    editor = atom.workspace.getActiveTextEditor()
    docText = editor.getText().split('\n')
    filePath = editor.getPath()
    openProjects = atom.project.getDirectories()
    activeProject = (dir for dir in openProjects when dir.contains(filePath))
    atom.project.repositoryForDirectory(activeProject[0])
    .then(runParser)
