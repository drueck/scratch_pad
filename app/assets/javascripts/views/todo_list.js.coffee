class App.Views.TodoList extends Backbone.View
  initialize: ->
    @todoItems = new App.Views.TodoItemsIndex(collection: @model.todoItems)
    @listenTo(@model.todoItems, "reset", @addNewUnlessExists)

  render: ->
    @$el.html(@todoItems.render().el)
    @addNewUnlessExists()
    this

  remove: ->
    @todoItems.remove(arguments...)
    super(arguments...)

  addNewUnlessExists: ->
    @model.todoItems.add({}) unless @hasNewTodoItem()

  hasNewTodoItem: ->
    @model.todoItems.length > 0 and @model.todoItems.last().isNew()
