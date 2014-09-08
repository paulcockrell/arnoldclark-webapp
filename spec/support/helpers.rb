require 'RMagick'

module Helpers
  IMAGE_DIFF_MAX = 0.05

  def compare(page)
    base_screenshot_image_path = page.base_screenshot_image_path
    raise unless base_screenshot_image_path

    tmp_img_path = build_tmp_image_path(base_screenshot_image_path)
    if screenshot_img = capture!(tmp_img_path)
      base_img = Magick::Image.read(base_screenshot_image_path)[0]
      _, diff_metric = base_img.compare_channel(screenshot_img, Magick::MeanSquaredErrorMetric)

      diff_metric
    else
      nil
    end
  ensure
    File.delete(tmp_img_path) if tmp_img_path && File.exists?(tmp_img_path)
  end

  private

  def build_tmp_image_path(base_screenshot_image_path)
    File.join(File.dirname(base_screenshot_image_path), "screenshot_#{rand(1000000)}.png")
  end

  def capture!(tmp_img_path)
    if @browser.driver.save_screenshot tmp_img_path
      # resize image as they must be exactly the same in width and height to be
      # able to run a comparission
      #
      image = Magick::Image.read(tmp_img_path).first.crop_resized(IMAGE_WIDTH, IMAGE_HEIGHT).write(tmp_img_path)

      image
    else
      nil
    end
  end
end