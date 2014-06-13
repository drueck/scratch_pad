class App.Views.AddActions extends Backbone.View
  template: JST['notes/add_actions']

  className: 'add-actions'

  events:
    'click .add-note': 'addNote'
    'click .add-todo-list': 'addTodoList'

  render: ->
    @$el.html(@template())
    this

  addNote: (e) ->
    e.preventDefault()
    @collection.add(new App.Models.StickyNote)

  addTodoList: (e) ->
    e.preventDefault()
    @collection.add(new App.Models.TodoList)
