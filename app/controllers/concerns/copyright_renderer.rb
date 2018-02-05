module CopyrightRenderer
  extend ActiveSupport::Concern

  included do
    before_action :copyright
  end
  
  def copyright
    # TODO: change "http://localhost:3000/" to the real url later
    @copyright = "&copy; #{Time.now.year} | <b><a href='http://localhost:3000/'>Hemroda Martin</a></b> All right reserved".html_safe
  end
end