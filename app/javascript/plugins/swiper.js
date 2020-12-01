import Swiper from 'swiper';
// import Swiper styles
import 'swiper/swiper-bundle.css';

const mySwiper = () => {
//initialize swiper when document ready
  if (document.querySelector('.swiper-container')) {
    new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        type: 'progressbar',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  }
}
export { mySwiper };
