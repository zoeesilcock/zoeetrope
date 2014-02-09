#= require backbone-rails
#= require templates/technologies

jQuery ->
  class Technology extends Backbone.Model
  class Technologies extends Backbone.Collection
    initialize: (models, options)->
      @projectId = options.projectId
    url: ->
      '/projects/' + @projectId + '/technologies'
    model: Technology

  class EditTechView extends Backbone.View
    template: JST["templates/technologies"]
    el: '#technologies-form'
    initialize: ->
      _.bindAll @, 'render'

      @collection = new Technologies([], projectId: @$el.data('project-id'))
      @collection.fetch()
      @collection.bind 'add', @render

      @render()

    render: ->
      $(@el).html(@template(technologies: @collection.toJSON()))

  new EditTechView
