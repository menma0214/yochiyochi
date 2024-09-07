// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"

//レビューの星
// Font Awesome のインポート
import "@fortawesome/fontawesome-free/js/all";
// jQueryのインポート
import $ from 'jquery';
import 'slick-carousel';

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
$(document).ready(function(){
  $('.slider').slick({
    // autoplay: true,       // 自動再生
    // autoplaySpeed: 2000,  // 2秒ごとに自動で次のスライドに移動
    dots: true,           // 下部にドットナビゲーションを表示
    arrows: true,         // 左右のナビゲーション矢印を表示
    infinite: true,       // スライドがループするように設定
    speed: 500,           // スライドの移動速度
    slidesToShow: 1,      // 一度に表示するスライドの数
    slidesToScroll: 1     // 一度にスクロールするスライドの数
  });
});
