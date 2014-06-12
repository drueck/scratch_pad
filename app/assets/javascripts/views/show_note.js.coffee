class App.Views.ShowNote extends Backbone.View
  template: JST['notes/show']

  className: 'note'

  initialize: ->
    @listenTo(@model, 'invalid', @addError)
    @listenTo(@model, 'error', @addError)
    @lastUpdated = new App.Views.LastUpdated(model: @model)

  events:
    'change': 'save'
    'keydown .note-title': 'blurIfEnter'
    'focus .note-title, .note-content': 'beginEditing'
    'blur .note-title, .note-content': 'endEditing'
    'click .destroy-note': 'destroyNote'

  render: ->
    @$el.html(@template(note: @model))
    @lastUpdated.setElement(@$('.normal-footer')).render()
    this

  remove: ->
    @lastUpdated.remove(arguments...)
    super(arguments...)

  save: (e) ->
    e.preventDefault()
    @model.set
      title: @$('.note-title').val()
      content: @$('.note-content').val()
    @model.save()

  blurIfEnter: (e) ->
    if e.keyCode == 13
      @$('input').blur()

  beginEditing: ->
    @$el.addClass('editing')
    @$el.removeClass('error')

  endEditing: ->
    @$el.removeClass('editing')

  destroyNote: (e) ->
    e.preventDefault()
    @model.destroy()
    @remove()

  addError: =>
    @$el.addClass('error')
