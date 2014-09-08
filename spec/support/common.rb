module Common
  module UrlHelper
    PLATFORM_MAP = {
      :development => "http://localhost:3000",
      :staging => "http://localhost:3000",
      :production => "http://localhost:3000"
    }

    def self.included(base)
      base.extend(ClassMethods)
    end

    def self.platform
      platform = ENV['PLATFORM'] ? ENV['PLATFORM'].downcase : 'development'
      PLATFORM_MAP[platform.to_sym]
    end

    module ClassMethods
      def build_uri(uri_path = '/')
        File.join UrlHelper.platform, uri_path
      end
    end
  end

  module ScreenshotHelper
    def base_screenshot_image_path
      File.join(File.dirname(__FILE__), "../screenshots", "#{self.class.to_s.downcase.gsub("::", "/")}.png")
    end
  end
end