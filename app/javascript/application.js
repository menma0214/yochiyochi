// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

//レビューの星
// Font Awesome のインポート
import "@fortawesome/fontawesome-free/js/all";
// jQueryのインポート
import $ from 'jquery';

$(document).on('turbo:load', function() {
  // スター評価の初期化
  $('#star-rating').on('click', '.fa-star', function() {
    const rating = $(this).data('value');
    $('#rating-input').val(rating);
    updateStars(rating);
  });

  function updateStars(rating) {
    $('#star-rating .fa-star').each(function() {
      $(this).toggleClass('fas', $(this).data('value') <= rating);
      $(this).toggleClass('far', $(this).data('value') > rating);
    });
  }
});