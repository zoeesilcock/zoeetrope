#= require backbone-rails
#= require jquery.sortable
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
    projectId: -> @$el.data('project-id')

    initialize: ->
      _.bindAll @, 'render', 'saveOrder'

      @collection = new Technologies([], projectId: @projectId())
      @collection.fetch()
      @collection.bind 'add', @render

      @render()

    render: ->
      @$el.html(@template(technologies: @collection.toJSON()))
      @$list = @$('ol.technologies')

      @$list.sortable onDrop: ($item, container, _super)=>
        _super($item, container)
        @saveOrder()

    saveOrder: ->
      order = _.map @$list.find('li'), (item)->
        return $(item).data('id')

      $.ajax
        url: '/projects/' + @projectId() + '/technologies_order',
        type: 'PUT'
        data: order: order

  new EditTechView
