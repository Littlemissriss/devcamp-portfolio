module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_page_defaults
  end 
  
  def set_page_defaults
    @page_title = "Devcamp Portfolio | Marissa Angell's Website"
    @seo_keywords = "Marissa Angell portfolio blog devcamp"
  end
end