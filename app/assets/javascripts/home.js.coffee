window.ArnoldClark ||= {}

class ArnoldClark.ImageModel
  constructor: (data) ->
    @url = data.url

class ArnoldClark.ImageManagerModel
  IMAGE_API_URL: "http://localhost:3001/api/v1/images"
  
  constructor: ->
    @images = ko.observableArray []
    @registration = ko.observable()
    @stock_reference = ko.observable()

  addImage: (image) ->
    @images.push image

  addImages: (images) ->
    for image in images
      @addImage new ArnoldClark.ImageModel(image)

  loadImages: (form_element) =>
    @clearImages()
    form_data = { registration: @registration(), stock_reference: @stock_reference() }

    $.getJSON @IMAGE_API_URL, form_data, (data) =>(
      @addImages data.images
    )

  clearImages: ->
    @images []

class ArnoldClark.Home extends ArnoldClark.Base
  constructor: ->
    super
    this

  index:() ->
    ko.applyBindings new ArnoldClark.ImageManagerModel
