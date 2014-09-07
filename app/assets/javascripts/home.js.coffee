window.ArnoldClark ||= {}

class ArnoldClark.ImageModel
  IMAGE_API_URL: "http://localhost:3001/api/v1/images"
  
  constructor: ->
    @images = ko.observableArray []
    @registration = ko.observable()
    @stock_reference = ko.observable()

  addImage: (image) ->
    @images.push image

  addImages: (images) ->
    @addImage image for image in images

  loadImages: (form_element) ->
    form_data = { registration: @registration(), stock_reference: @stock_reference() }
    $.getJSON @IMAGE_API_URL, form_data, (data) ->
      if data.success
        images = data #images = JSON.parse(data)
        console.log images
      else
        # XXX display some error

class ArnoldClark.Home extends ArnoldClark.Base
  constructor: ->
    super
    this

  index:() ->
    image_model = new ArnoldClark.ImageModel
    ko.applyBindings(image_model)

