class App.Views.Notes extends Backbone.View
  template: JST['notes/index']

  events:
    'click a': 'showNote'

  render: ->
    @$el.html(@template(notes: @collection))
    this

  showNote: (e) ->
    e.preventDefault()
    $this = $(e.currentTarget)
    url = $this.attr("href")
    Backbone.history.navigate(url, trigger: true)
