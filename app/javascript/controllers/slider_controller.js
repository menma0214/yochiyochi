import { Controller } from "@hotwired/stimulus";
import 'slick-carousel';
import $ from 'jquery';

// Connects to data-controller="slider"
export default class extends Controller {
  connect() {
    $(this.element).slick({
      dots: true,
      infinite: true,
      speed: 300,
      slidesToShow: 1,
      adaptiveHeight: true,
      responsive: [
        {
          breakpoint: 600,
          settings: {
            arrows: false  // 600px以下では矢印を非表示にする
          }
        }
      ]
    });
  }
}
