module CopyrightRenderer
  extend ActiveSupport::Concern

  included do
    before_action :copyright
  end
  
  def copyright
    @copyright = "&copy; #{Time.now.year} | <b>Hemroda Martin</b> All right reserved".html_safe
  end
end