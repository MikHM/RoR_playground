module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Hemroda Martin"
    @seo_keywords = "Hemroda Martin Portfolio"
  end

end