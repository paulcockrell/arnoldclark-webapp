window.ArnoldClark ||= {}

class ArnoldClark.ImageModel
  constructor: (data) ->
    @present = data.present
    @url = data.url
    @image_size = data.image_size
    @camera_angle = data.camera_angle

  thumbnail: ->
    @image_size == "350"

  mainUrl: ->
    console.log @url
    @url.replace /350/, 800


class ArnoldClark.ImageManagerModel
  IMAGE_API_URL: "http://localhost:3001/api/v1/images"
  
  constructor: ->
    @images = ko.observableArray []
    @registration = ko.observable()
    @stock_reference = ko.observable()
    @status = ko.observable()

  loadingStatus: ->
    @status() != ""

  statusColor: ->
    if @status() == ""
      ""
    else if @status() == "Loading images..."
      "alert-warning"
    else if @status() == "Loaded #{@images().length} images"
      "alert-success"
    else
      "alert-danger"

  addImage: (image) ->
    @images.push image

  addImages: (images_data) ->
    for image_data in images_data
      image = new ArnoldClark.ImageModel(image_data)
      @addImage image 

  loadImages: (form_element) =>
    @clearImages()
    @status "Loading images..."
    form_data = { registration: @registration(), stock_reference: @stock_reference() }

    $.getJSON(@IMAGE_API_URL, form_data, (data) =>
      @status "Loaded #{data.images.length} images"
      @addImages data.images
    ).fail =>
      @status "Error loading images"
    
  clearImages: ->
    @images []

class ArnoldClark.Home extends ArnoldClark.Base
  constructor: ->
    super
    this

  index:() ->
    ko.applyBindings new ArnoldClark.ImageManagerModel
