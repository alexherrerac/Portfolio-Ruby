module DefaultPageContent
  extend ActiveSupport::Concern
  
  included do
    before_filter :set_title
  end
  
  def set_title
    @page_title = "Alexander Portfolio | My Portfolio Website"
  end

end