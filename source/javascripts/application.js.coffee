#= require_tree ./vendor
#= require_tree ./lib
#= require bootstrap

populateExhibition = ->

  random_paintings = _.sample paintings, 9
  $.each [1..3], (index,num) ->
    t = $('.template').clone()
    $.each [1..2], (index,value) ->
      image = $('.template .span4').clone()
      t.append image
    t.removeClass 'hide'
    t.removeClass 'template'
    t.addClass 'shifty_image'
    t.find('a').each (index2, image) ->
      rand_paint = random_paintings[(index*3)+index2]
      $(image).find('img').attr 'src', "images/paintings/#{rand_paint}"
      $(image).attr 'href', "images/paintings/#{rand_paint}"
      $(image).addClass('shifty_image')
    $('.stuff').append t

$(document).on "mouseenter", ".shifty_image", ->
  usedPics = []
  picArray = paintings
  currentPic = $(this).find('img').attr('src').match(/[\w-]+\.(jpg|png|gif|jpeg)$/)
  picArray = _.difference picArray, currentPic

  $('.shifty_image').not($(this)).each (i,painting) ->
    picArray = _.difference picArray, usedPics
    newImage = picArray[Math.floor(Math.random()*picArray.length)]
    usedPics.push newImage
    $(painting).find('img').attr('src', "images/paintings/#{newImage}")

$ ->
  $('#carousel .item').first().addClass('active')

  populateExhibition()
  $('.shifty_image a').colorbox 
    rel: 'gal',
    scalePhotos: true
