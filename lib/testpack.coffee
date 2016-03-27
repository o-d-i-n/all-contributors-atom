# TestpackView = require './testpack-view'
{CompositeDisposable} = require 'atom'

module.exports = Testpack =
  testpackView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    # @testpackView = new TestpackView(state.testpackViewState)
    # @modalPanel = atom.workspace.addModalPanel(item: @testpackView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'testpack:transform': => @transform()

  deactivate: ->
    # @modalPanel.destroy()
    @subscriptions.dispose()
    # @testpackView.destroy()

  serialize: ->
    testpackViewState: @testpackView.serialize()

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

    mapToStr = (emojiKey,author) ->
      git = atom.project.getRepositories()[0].getOriginURL()
      git = git.substr(0,git.length-4)
      if emojiKey=="code" or emojiKey=="doc" or emojiKey=="tests"
        "[#{emojiMap[emojiKey]}](#{git}/commits?author=#{author})"
      else
        "#{emojiMap[emojiKey]}"

    parseLine = (line) ->
      entities = line.split(' ')
      name = entities[0].split('_').join(' ')
      strBuild = "| [![#{name}](https://avatars.githubusercontent.com/#{entities[1]}?s=100)<br /><sub>#{name}</sub>](#{entities[2]})<br />"
      #[📖](https://github.com/kentcdodds/all-contributors/commits?author=kentcdodds) 👀 💁
      #(mapStr entity, entities[1] for entity, i in entities when i>2)
      strBuild += (mapToStr entity, entities[1] for entity, i in entities when i>2).join(' ')
      strBuild
      #console.log entity for entity in entities

    editor = atom.workspace.getActiveTextEditor()
    currentBuffer = editor.getSelectedText()
    totalContri = currentBuffer.split('\n')
    contriLen = totalContri.length
    totalContri = (parseLine line for line in totalContri).join(' ')
    totalContri += " |\n"
    totalContri += ("| :---: " for num in [contriLen..1]).join('')
    totalContri += '|'
    editor.insertText(totalContri)
    #parseLine line for line in totalContri
    ###
    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
      ###
