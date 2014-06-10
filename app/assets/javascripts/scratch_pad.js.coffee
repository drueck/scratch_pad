window.ScratchPad =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: -> alert('Hello from Backbone!')

window.App = Window.ScratchPad

$(document).ready ->
  ScratchPad.initialize()
