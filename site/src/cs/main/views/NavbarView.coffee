define [
  "backbone"
  "DecksView"
  "hbs!../../../templates/PlayNow"
], (Backbone, DecksView, template) ->

  class NavbarView extends Backbone.View

    events:
      'click #playnow': 'startPlayer'

    initialize: ->
      @decksView = new DecksView collection: @collection

    render: ->
      @$el.append @decksView.render().el
      @$el.append template
      @

    setSelected: (name) ->
      $('select').val name
      $('select').change() unless name

    startPlayer: =>
      window.app.router.navigate "player/#{$('select').val()}", trigger: true
