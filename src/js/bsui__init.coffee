alert 'jQuery environment not loaded !' if ! jQuery
alert 'Backbone environment not loaded !' if ! Backbone
Backbone.bsui ||= {}
$ ->
    class Backbone.bsui.ViewBase extends Backbone.View
        css: ->
            switch arguments.length
                when 1
                    return @$el.css arguments[0]
                when 2
                    @$el.css arguments[0], arguments[1]
        on: ->
            switch arguments.length
                when 1
                    @$el.on arguments[0]
                when 2
                    @$el.on arguments[0], arguments[1]
                when 3
                    @$el.on arguments[0], arguments[1], arguments[2]
                when 4
                    @$el.on arguments[0], arguments[1], arguments[2], arguments[3]
        off: ->
            switch arguments.length
                when 1
                    @$el.off arguments[0]
                when 2
                    @$el.off arguments[0], arguments[1]
                when 3
                    @$el.off arguments[0], arguments[1], arguments[2]
                when 4
                    @$el.off arguments[0], arguments[1], arguments[2], arguments[3]


