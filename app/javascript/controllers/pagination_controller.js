import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["pagination"]

  connect() {
    this.checkWindowSize();
    window.addEventListener("resize", this.checkWindowSize.bind(this));
  }

  disconnect() {
    window.removeEventListener("resize", this.checkWindowSize.bind(this));
  }

  checkWindowSize() {
    if (window.innerWidth <= 600) {
      console.log('Adding small-screen class');
      this.showLimitedPagination();
    } else {
      console.log('Removing small-screen class');
      this.showFullPagination(); // ここでエラーが発生している
    }
  }

  showLimitedPagination() {
    this.paginationTargets.forEach(pagination => {
      pagination.classList.add('small-screen');
    });
  }

  showFullPagination() {
    this.paginationTargets.forEach(pagination => {
      pagination.classList.remove('small-screen');
    });
  }
}
