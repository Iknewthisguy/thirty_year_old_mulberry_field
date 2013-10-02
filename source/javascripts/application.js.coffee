#= require_tree ./vendor
#= require_tree ./lib
#= require bootstrap

# $paintings = []
# for painting in paintings
#   $paintings.push painting.replace(".jpg", "-medium-400x300.jpg")

$ ->
  $('#carousel .item').first().addClass('active')

  $('.shifty_image a, .archive_image a').colorbox 
    rel: 'gal',
    scalePhotos: true

$paintings = []
for painting in paintings
  $paintings.push painting.replace(".jpg", "-medium-400x300.jpg")

$(document).on "mouseenter", ".shifty_image", ->
  usedPics = []
  picArray = $paintings
  currentPic = $(this).find('img').attr('src').match(/paintings\/(.+)$/)
  console.log currentPic
  picArray = _.difference picArray, currentPic
  console.log picArray

  $('.shifty_image').not($(this)).each (i,painting) ->
    picArray = _.difference picArray, usedPics
    newImage = picArray[Math.floor(Math.random()*picArray.length)]
    usedPics.push newImage
    $(painting).fadeOut()
    $(painting).find('img').attr('src', "images/paintings/#{newImage}")
    $(painting).fadeIn()