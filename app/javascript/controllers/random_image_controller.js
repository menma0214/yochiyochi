import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["image"]

  connect() {
    this.showRandomImages();
  }

  showRandomImages() {
    const images = this.imageTargets;
    const imagesPerSet = 6; // 一度に表示する画像の数
    const animationDuration = 1500; // フェードイン・フェードアウトの時間（ミリ秒）
    const gridSize = 6; // グリッドサイズ（6x6グリッド）
    let occupiedGrids = [];

    function getRandom(min, max) {
      return Math.random() * (max - min) + min;
    }

    function getRandomGridPosition() {
      let gridX, gridY;
      let tries = 0;
      const maxTries = 100; // 最大100回試して重ならないグリッドを見つける

      do {
        gridX = Math.floor(getRandom(0, gridSize)); // グリッド内のX座標
        gridY = Math.floor(getRandom(0, gridSize)); // グリッド内のY座標
        tries++;
      } while (occupiedGrids.includes(`${gridX},${gridY}`) && tries < maxTries);

      // グリッドの座標を記録
      occupiedGrids.push(`${gridX},${gridY}`);
      return { gridX, gridY };
    }

    function randomizeImage(img) {
      const size = getRandom(150, 350);
      img.style.width = `${size}px`;

      const { gridX, gridY } = getRandomGridPosition();

      // 画像が画面から飛び出さないように調整
      const screenHeight = window.innerHeight; // 画面の高さ
      const screenWidth = window.innerWidth;   // 画面の幅
      const imageHeight = img.offsetHeight;    // 画像の高さ
      const imageWidth = img.offsetWidth;      // 画像の幅

      // 画像が画面内に収まるように、topとleftの最大値を調整
      const maxTop = screenHeight - imageHeight;
      const maxLeft = screenWidth - imageWidth;

      // グリッド内の位置をvhとvwで計算し、画面からはみ出さないように制限
      const newTop = Math.min(gridY * (100 / gridSize), maxTop / screenHeight * 100); // vhで制限
      const newLeft = Math.min(gridX * (100 / gridSize), maxLeft / screenWidth * 100); // vwで制限

      img.style.top = `${newTop}vh`;
      img.style.left = `${newLeft}vw`;
      img.style.transform = `rotate(${getRandom(-30, 30)}deg)`;
      img.style.opacity = 1;
    }

    function hideAllImages() {
      images.forEach(img => img.style.opacity = 0);
    }

    function showRandomSet() {
      hideAllImages();
      occupiedGrids = []; // グリッドの占有情報をリセット
      const randomImages = images.sort(() => 0.5 - Math.random()).slice(0, imagesPerSet);

      // アニメーション終了後にランダムな画像をフェードイン
      setTimeout(() => {
        randomImages.forEach(img => randomizeImage(img));
      }, animationDuration);
    }

    // 最初にランダムな画像を表示
    showRandomSet();

    // 3秒ごとに次のセットを表示（フェードアウト、次にフェードイン）
    setInterval(showRandomSet, 2500 + animationDuration);

    // トップページへの遷移時にアニメーションを再実行
    function checkAndRunAnimation() {
      if (location.pathname === '/tops') {
        showRandomSet();
      }
    }

    // 「戻る」「進む」ボタンが押されたとき
    window.addEventListener('popstate', function() {
      checkAndRunAnimation();
    });
  }
}
