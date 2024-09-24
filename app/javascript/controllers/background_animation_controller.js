import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="background-animation"
export default class extends Controller {
  connect() {
    console.log("animation");
    this.startSnowfall();
  }

  startSnowfall() {
    const snowflakes = this.element.querySelectorAll('.snowflake');
    
    snowflakes.forEach((flake) => {
      this.animateSnowflake(flake);

      // アニメーションが終了するたびにランダムな位置に再設定
      flake.addEventListener('animationend', () => {
        this.resetSnowflakePosition(flake);
      });
    });
  }

  animateSnowflake(flake) {
    const duration = Math.random() * 10 + 5; // アニメーションの持続時間
    const rotation = Math.random() * 360; // ランダムな回転角度
    const delay = Math.random() * 5; // 開始遅延

    // ランダムな位置に設定して降らせる
    const xPosition = Math.random() * 100;
    flake.style.left = `${xPosition}%`;
    flake.style.animation = `fall ${duration}s linear ${delay}s infinite, rotate ${duration}s linear ${delay}s infinite`;

    // 画像の大きさもランダムに（オプション）
    const size = Math.random() * 30 + 40; // 50px程度の大きさ
    flake.style.width = `${size}px`;
  }

  // アニメーション終了後、新しいランダムな位置で再スタート
  resetSnowflakePosition(flake) {
    const newPosition = Math.random() * 100; // 新しい横位置
    flake.style.left = `${newPosition}%`; // ランダムに位置を設定
    flake.style.animation = ''; // アニメーションを一旦リセット
    setTimeout(() => {
      this.animateSnowflake(flake); // 再度アニメーションを設定
    }, 10); // アニメーションを少し遅らせて再設定
  }
}
