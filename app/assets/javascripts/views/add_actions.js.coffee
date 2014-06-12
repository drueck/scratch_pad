class App.Views.AddActions extends Backbone.View
  template: JST['notes/add_actions']

  className: 'add-actions'

  events:
    'click .add-note': 'addNote'

  render: ->
    @$el.html(@template())
    this

  addNote: (e) ->
    e.preventDefault()
    @collection.add(new App.Models.StickyNote)
