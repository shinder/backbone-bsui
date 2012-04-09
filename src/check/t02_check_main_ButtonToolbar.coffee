$ = jQuery

$ ->
    class MainView extends Backbone.View
        el: '#shinder'
        initialize: ->
            group = new Backbone.bsui.ButtonGroup
                btnType: 'btn-info'
                # sizeType: 'btn-mini'
                toggle: true
                buttons: [
                    {
                        label:'one'
                    },
                    {
                        label:'two'
                    },
                    {
                        label:'three'
                    }
                ]
            group2 = new Backbone.bsui.ButtonGroup
                btnType: ''
                sizeType: 'btn-small'
                toggle: true
                buttons: [
                    {
                        label:'A'
                        click: (event)->
                            console.log event.target
                    },
                    {
                        label:'B'
                        click: (event)->
                            console.log event.button
                    },
                    {
                        label:'C'
                        click: (event)->
                            console.log event.button
                    }
                ]
            toolbar = new Backbone.bsui.ButtonToolbar
            toolbar.addGroup(group).addGroup(group2)
            @$el.append toolbar.el

            myButton3 = new Backbone.bsui.Button
                btnType: 'btn-warning'
                sizeType: 'btn-mini'
                label:'Hello'
                toggle: true
            toolbar.addSingleButton(myButton3)

    new MainView