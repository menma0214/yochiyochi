import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="line-share"
export default class extends Controller {
  connect() {
    // 現在のページのURLを取得
    const currentUrl = window.location.href;

    // data-url属性に現在のページURLを設定
    his.element.setAttribute('data-url', currentUrl);

    // LINEシェアボタンを表示
    this.element.style.display = "block";
  }
}
