// app/javascript/controllers/autocomplete_controller.js
import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete"
export default class extends Controller {
  static values = { url: String }
  static targets = ["results"]

  search(event) {
    const query = encodeURIComponent(event.target.value);  // 修正: クエリのエンコード
    const url = `${this.urlValue}?q=${query}`;

    fetch(url)
      .then(response => response.json())
      .then(data => {
        this.updateResults(data);
      })
      .catch(error => console.error('Error fetching autocomplete data:', error));
  }

  updateResults(data) {
    this.resultsTarget.innerHTML = '';

    data.forEach(item => {
      const li = document.createElement('li');
      li.textContent = item.title;  // 修正: 表示内容の変更
      li.addEventListener('click', () => {
        this.selectResult(item);
      });
      this.resultsTarget.appendChild(li);
    });
  }

  selectResult(item) {
    this.element.querySelector('input').value = item.title;  // 修正: 設定内容の変更

    this.resultsTarget.innerHTML = '';
  }
}
