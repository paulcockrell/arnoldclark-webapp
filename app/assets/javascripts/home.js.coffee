window.ArnoldClark ||= {}

class ArnoldClark.ImageModel
  constructor: (data) ->
    @camera_angle = data.camera_angle
    @image_size = data.image_size
    @obfuscated_key = data.obfuscated_key
    @present = data.present
    @registration = data.registration
    @stock_reference = data.stock_reference
    @url = data.url


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
    else if @status() == "Loaded #{@presentImages().length} of #{@images().length} images"
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
      @addImages data.images
      @status "Loaded #{@presentImages().length} of #{@images().length} images"
    ).fail =>
      @status "Error loading images"

  clearImages: ->
    @images []

  presentImages: ->
    @images().filter (image) -> image.present

class ArnoldClark.Home extends ArnoldClark.Base
  constructor: ->
    super
    this

  index:() ->
    ko.applyBindings new ArnoldClark.ImageManagerModel
