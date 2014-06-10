window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @AllNotes = [
      { id: 1, title: "The first note", content: "I am a note!" }
      { id: 2, title: "The second note", content: "" }
      { id: 3, title: "The third note", content: "more notes" }
    ]
    new @Routers.ScratchPadRouter
    Backbone.history.start(pushState: true)

window.App = window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
