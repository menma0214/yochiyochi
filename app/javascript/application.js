// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "@hotwired/stimulus"
import "./controllers"
import * as bootstrap from "bootstrap"
import 'slick-carousel';
// console.log("Application JS Loaded");  // これが表示されれば、JSが読み込まれている

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
// $(document).ready(function(){
//   $('.slider').slick({
//     // autoplay: true,       // 自動再生
//     // autoplaySpeed: 2000,  // 2秒ごとに自動で次のスライドに移動
//     dots: true,           // 下部にドットナビゲーションを表示
//     arrows: true,         // 左右のナビゲーション矢印を表示
//     infinite: true,       // スライドがループするように設定
//     speed: 500,           // スライドの移動速度
//     slidesToShow: 1,      // 一度に表示するスライドの数
//     slidesToScroll: 1     // 一度にスクロールするスライドの数
//   });
// });

// window.addEventListener("pageshow", function() {
//   const images = document.querySelectorAll('#image-container img');
//   const imagesPerSet = 10; // 一度に表示する画像の数
//   const minOverlap = 5;  // 最小の画像の重なり（％）
//   const maxOverlap = 10;  // 最大の画像の重なり（％）

//   function getRandom(min, max) {
//     return Math.random() * (max - min) + min;
//   }

//   function showRandomImages() {
//     // すべての画像を非表示にする
//     images.forEach(img => img.style.opacity = 0);

//     // ランダムな8枚の画像を表示する
//     let randomImages = Array.from(images).sort(() => 0.5 - Math.random()).slice(0, imagesPerSet);

//     randomImages.forEach((img, index) => {
//       // ランダムな位置を設定（端に近い範囲も含める）
//       let overlapRatio = getRandom(minOverlap, maxOverlap);
//       img.style.top = `${getRandom(overlapRatio, 80 - overlapRatio)}vh`;  // 上下の表示範囲を広げる
//       img.style.left = `${getRandom(overlapRatio, 95 - overlapRatio)}vw`; // 左右の表示範囲を広げる

//       // ランダムなサイズを設定
//       const size = getRandom(200, 350);
//       img.style.width = `${size}px`;
//       img.style.height = 'auto';

//       // ランダムに回転角度を設定
//       const angle = getRandom(-45, 45);
//       img.style.transform = `rotate(${angle}deg)`;

//       // 重なりを調整（z-indexの設定）
//       img.style.zIndex = Math.floor(getRandom(1, 100)); // z-indexをランダムに設定

//       // 画像を表示
//       img.style.opacity = 1;
//     });

//     // 5秒後に次のセットを表示
//     setTimeout(() => {
//       showRandomImages();
//     }, 3000);
//   }

//   showRandomImages(); // 最初のアニメーション開始

//   // トップページへの遷移時にアニメーションを再実行
//   function checkAndRunAnimation() {
//     if (location.pathname === '/tops') {
//       showRandomImages();
//     }
//   }

//   // 「戻る」「進む」ボタンが押されたとき
//   window.addEventListener('popstate', function() {
//     checkAndRunAnimation();
//   });

//   // ロゴクリックでトップページに遷移する場合
//   document.querySelector('.title-logo').addEventListener('click', function(event) {
//     event.preventDefault(); // 通常のリンク動作を防止
//     history.pushState(null, '', '/tops'); // URLを変更
//     checkAndRunAnimation(); // アニメーションを再実行
//   });
//   document.addEventListener("turbo:load", function() {
//     // アニメーションの初期化やイベント設定
//     const topLink = document.getElementById("top-link");
  
//     if (topLink) {
//       topLink.addEventListener("click", function(event) {
//         event.preventDefault(); // 通常のリンク動作を防ぐ
//         history.pushState(null, '', '/tops');
//         showRandomImages(); // アニメーションを再実行
//       });
//     }
  
//     window.addEventListener('popstate', function() {
//       if (location.pathname === '/tops') {
//         showRandomImages();
//       }
//     });
//   });
  
  
// });




