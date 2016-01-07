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
      'keyup input.new': 'submitNew',
      'click i': 'remove'
    }
    projectId: -> @$el.data('project-id')
    justSaved: false

    initialize: ->
      _.bindAll @, 'render', 'saveOrder', 'submitNew', 'technologySaved', 'remove'

      @collection = new Technologies([], projectId: @projectId())
      @collection.fetch()
      @collection.on({ 'add': @render, 'remove': @render })

      @render()

    render: ->
      @$el.html(@template(technologies: @collection.toJSON()))
      @$('input.new').focus() if @justSaved
      @justSaved = false

      @$('ol.technologies').sortable onDrop: ($item, container, _super) =>
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
      @justSaved = true
      @collection.add(model)

    remove: (e) =>
      technologyId = $(e.currentTarget).closest('li').data('id')
      @collection.get(technologyId).destroy()
      @collection.remove(technologyId)

    saveOrder: ->
      order = _.map @$('ol.technologies li'), (item)->
        return $(item).data('id')

      $.ajax
        url: '/projects/' + @projectId() + '/used_technologies/sort',
        type: 'PUT'
        data: order: order

  if $('.div.technologies-form').length
    new EditTechView
