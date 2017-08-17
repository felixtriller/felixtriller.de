window.addEventListener('load', function () {
  var article_images = document.querySelectorAll('article img');

  Lightense(article_images, {
    padding: 20
  });
});

var articles = document.querySelectorAll('[data-readingtime]');

if (articles.length > 0) {
  var reading_times = [];

  Array.prototype.forEach.call(articles, function (el) {
    return reading_times.push(el.getAttribute('data-readingtime'));
  });

  var max_reading_time = Math.max.apply(null, reading_times);

  Array.prototype.forEach.call(articles, function (el) {
    var reading_percent, reading_time;
    reading_time = el.getAttribute('data-readingtime' || 0);
    reading_percent = reading_time / max_reading_time * 100;
    el.style.width = reading_percent + "%";
  });
}
