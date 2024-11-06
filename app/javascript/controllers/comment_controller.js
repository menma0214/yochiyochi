import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="comment"

export default class extends Controller {
  static targets = ["content", "form"];

  // 編集ボタンがクリックされたときの処理
  edit(event) {
    event.preventDefault();
    this.contentTarget.classList.add("hidden");
    this.formTarget.classList.remove("hidden");
  }

  // 更新後の表示を切り替える処理
  cancel(event) {
    event.preventDefault();
    this.contentTarget.classList.remove("hidden");
    this.formTarget.classList.add("hidden");
  }
}

