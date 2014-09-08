module Home
  class IndexPage
    include PageObject, DataMagic
  
    page_url '/'
  
    div :header, :class => "navbar-fixed-top"
    div :jumbotron, :class => "jumbotron"
    div :entry_form, :class => "entry-form"
    div :gallery, :class => "image-gallery"
    div :alert, :class => "alert"
    text_field :registration, :id    => "registration"
    text_field :stock_reference, :id => "stock_reference"
    button :submit, :name  => "submit"
    # form :login_form, :class     => "login-form"
    # div :footer, :class => "footer"
    # div :footnote, :class => "footnote"
  
    def search(registration, stock_reference)
      self.registration = registration
      self.stock_reference = stock_reference
      self.submit
    end
  
    def render_successfull?
      header_exists? &&
        jumbotron_exists? &&
        entry_form_exists? &&
        gallery_exists? #&&
        # jumbotron_exists? &&
        # email_input_exists? &&
        # password_input_exists? &&
        # sign_in_button_exists? &&
        # footer_exists? &&
        # footnote_exists?
    end
  
    def header_exists?
      !self.header.nil?
    end
  
    def jumbotron_exists?
      !self.jumbotron.nil?
    end
  
    def entry_form_exists?
      !self.entry_form.nil?
    end
  
    def gallery_exists?
      !self.gallery.nil?
    end
  
    # def email_input_exists?
    #   !self.email_element.nil?
    # end
  
    # def password_input_exists?
    #   !self.password_element.nil?
    # end
  
    # def sign_in_button_exists?
    #   !self.login_btn_element.nil?
    # end
  
    # def footer_exists?
    #   !self.footer_element.nil?
    # end
  
    # def footnote_exists?
    #   !self.footnote_element.nil?
    # end
  
  end
end
