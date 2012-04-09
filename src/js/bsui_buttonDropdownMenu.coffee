alert 'include "bsui__init.coffee" first !' if ! Backbone
$ = jQuery
Backbone.bsui ||= {}
$ ->
    class Backbone.bsui.ButtonDropdownMenu extends Backbone.bsui.ViewBase
        tagName     : 'div'
        # sizeTypes : ['btn-large', 'btn-small', 'btn-mini']
        sizeType    : 'btn-large'
        # btnTypes  : ['btn-primary', 'btn-warning', 'btn-danger', 'btn-success', 'btn-info', 'btn-inverse']
        btnType     : ''
        # initData  : { list:[{label:'1', click:}] }
        initData    : null
        label       : 'label'
        templateStr : '
              <a class="btn dropdown-toggle <%=sizeType%> <%=btnType%>" data-toggle="dropdown" href="#">
                <%=label%>
                <span class="caret"></span>
              </a>
              <ul class="dropdown-menu">
              </ul>
        '
        listItemStr : '<li><a href="#"><%=label%></a></li>'
        listDividerStr : '<li class="divider"/>'

        initialize: (options)->
            _.bindAll @, 'render'
            @initData = options
            @render()

        render: ->
            @template = _.template @templateStr
            @$el.addClass 'btn-group'
            return @ if not @initData
            @sizeType = @initData.sizeType if @initData.sizeType
            @btnType = @initData.btnType if @initData.btnType
            @label = @initData.label if @initData.label
            @$el.append @template @

            if @initData.list and @initData.list.length
                $menu = $('.dropdown-menu', @$el)
                for item in @initData.list
                    if item.label is '---'
                        $menu.append @listDividerStr
                    else
                        $btn = $ (_.template @listItemStr) item
                        $menu.append $btn
                        (($btn, item, menu)->
                            $btn.on 'click', (event)->
                                event.label = item.label
                                item.click event if item.click
                        ) $btn, item, @
            @

