#= require_tree ./vendor
#= require_tree ./lib
#= require bootstrap

# $paintings = []
# for painting in paintings
#   $paintings.push painting.replace(".jpg", "-medium-400x300.jpg")


$ ->
  # @counter = 0
  # $('.shifty_image').on "click", ->
  #   @counter += 1

  $('#carousel .item').first().addClass('active')
  $('#carousel').each ->
    $(this).carousel interval: false

  $('.shifty_image a, .archive_image a').colorbox 
    rel: 'gal',
    scalePhotos: true

$paintings = []
for painting in paintings
  $paintings.push painting.replace(".jpg", "-medium-400x300.jpg")

$(".shifty_image").hover ( ->
  usedPics = []
  picArray = $paintings
  currentPic = $(this).find('img').attr('src').match(/paintings\/(.+)$/)
  picArray = _.difference picArray, currentPic


  $('.shifty_image').each (i,painting) ->
    picArray = _.difference picArray, usedPics
    newImage = picArray[Math.floor(Math.random()*picArray.length)]
    usedPics.push newImage
    $(painting).find('img').attr('src', "/images/paintings/#{newImage}")
    if i % 2 is 0
      $(painting).find('a').attr('href', "/images/paintings/#{newImage.replace("-medium-400x300.jpg", ".jpg")}")
    )