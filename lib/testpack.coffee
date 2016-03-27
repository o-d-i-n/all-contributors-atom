TestpackView = require './testpack-view'
{CompositeDisposable} = require 'atom'

module.exports = Testpack =
  testpackView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @testpackView = new TestpackView(state.testpackViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @testpackView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'testpack:toggle': => @toggle()

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @testpackView.destroy()

  serialize: ->
    testpackViewState: @testpackView.serialize()

  toggle: ->
    console.log 'Testpack was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      @modalPanel.show()
