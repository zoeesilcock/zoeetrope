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
    list: 'ol.technologies'
    initialize: ->
      _.bindAll @, 'render', 'saveOrder'

      @collection = new Technologies([], projectId: @$el.data('project-id'))
      @collection.fetch()
      @collection.bind 'add', @render

      @render()

    render: ->
      $(@el).html(@template(technologies: @collection.toJSON()))
      @$(@list).sortable(onDrop: @saveOrder)

    saveOrder: ($item, container, _super)->
      _super($item, container)

      order = _.map @$(@list).find('li'), (item)->
        return $(item).data('id')

      console.log(JSON.stringify(order))
      console.log('orders received!')

  new EditTechView
