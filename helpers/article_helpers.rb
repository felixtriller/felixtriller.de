module ArticleHelpers
  def reading_time(article, options = {})
    text = Nokogiri::HTML(article.body).text

    if options[:format] && options[:format] == :seconds
      hms = text.reading_time(options.merge(format: :raw))

      hms[0] * 60 * 60 + hms[1] * 60 + hms[2]
    else
      text.reading_time(options)
    end
  end
end