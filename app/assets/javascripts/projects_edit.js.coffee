#= require backbone-rails
#= require jquery.sortable
#= require templates/technologies

jQuery ->
  class Technology extends Backbone.Model
    urlRoot: ->
      '/projects/' + @get('project_id') + '/used_technologies'

  class Technologies extends Backbone.Collection
    initialize: (models, options)->
      @projectId = options.projectId
    url: ->
      '/projects/' + @projectId + '/used_technologies'
    model: Technology

  class EditTechView extends Backbone.View
    template: JST["templates/technologies"]
    el: 'div.technologies-form'
    events: {
      'keyup input.new': 'submitNew'
    },
    projectId: -> @$el.data('project-id')

    initialize: ->
      _.bindAll @, 'render', 'saveOrder', 'submitNew', 'technologySaved'

      @collection = new Technologies([], projectId: @projectId())
      @collection.fetch()
      @collection.bind 'add', @render

      @render()

    render: ->
      @$el.html(@template(technologies: @collection.toJSON()))

      @$('ol.technologies').sortable onDrop: ($item, container, _super)=>
        _super($item, container)
        @saveOrder()

    submitNew: (e) =>
      if e.which == 13
        technology = new Technology({
          title: $(e.currentTarget).val(),
          project_id: @projectId()
        })

        technology.save([], { success: @technologySaved })

    technologySaved: (model) =>
      @collection.add(model)

    saveOrder: ->
      order = _.map @$('ol.technologies li'), (item)->
        return $(item).data('id')

      $.ajax
        url: '/projects/' + @projectId() + '/used_technologies/sort',
        type: 'PUT'
        data: order: order

  new EditTechView
