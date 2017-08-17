# Initialize Lightense image thing
window.addEventListener 'load', ->
  article_images = document.querySelectorAll 'article img'
  Lightense article_images,
    padding: 20

# Visualize reading times
articles = document.querySelectorAll('[data-readingtime]')

if articles.length > 0
  reading_times = []

  Array.prototype.forEach.call articles, (el) ->
    reading_times.push el.getAttribute 'data-readingtime'

  max_reading_time = Math.max.apply(null, reading_times)

  Array.prototype.forEach.call articles, (el) ->
    reading_time = el.getAttribute 'data-readingtime' || 0
    reading_percent = reading_time / max_reading_time * 100
    el.style.width = "#{reading_percent}%"
