alert 'include "bsui__init.coffee" first !' if ! Backbone
$ = jQuery
Backbone.bsui ||= {}
$ ->
    class Backbone.bsui.SimpleNavbar extends Backbone.bsui.ViewBase
        tagName     : 'button'
        # btn-large, btn-small, btn-mini
        sizeType        : 'btn-large'
        # btn-primary, btn-warning, btn-danger, btn-success, btn-info, btn-inverse
        btnType     : 'btn-primary'
        label       : 'label'
        toggle      : false
        selected    : false
        disabled    : false
        templateStr : '<<%=tagName%> class="btn"><%=label%></<%=tagName%>>'
        events      :
            'click' : 'click'

        initialize: (options)->
            _.bindAll @, 'render'
            for key, value of options
                @[key] = value
            @template = _.template @templateStr
            @setElement @template @
            @render()
        render: ->
            @$el.addClass @sizeType
            @$el.addClass @btnType
            if @disabled
                @$el.addClass 'disabled'
            else
                @$el.removeClass 'disabled'
            if @toggle and @selected
                @$el.addClass 'active'
            else
                @$el.removeClass 'active'
            @$el.html @label
            @
        setAttr: (options)->
            for key, value of options
                @[key] = value
            @render()
            @
        click: ->
            if @disabled then return
            @selected = not @selected if @toggle
            @render()

