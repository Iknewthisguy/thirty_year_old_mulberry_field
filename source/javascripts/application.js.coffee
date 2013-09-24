#= require_tree ./vendor
#= require_tree ./lib
#= require bootstrap

$ ->
  $('#carousel .item').first().addClass('active')