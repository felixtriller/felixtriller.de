module MetaHelpers
  def page_title
    # TODO do this nice
    title = current_page.data.title ? current_page.data.title + ' - ' : ''
    title << data.site.title
  end

  def page_description
    # TODO page excerpt?
    current_page.data.description || data.site.description
  end
end