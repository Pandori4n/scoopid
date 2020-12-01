import Swiper from 'swiper';
// import Swiper styles
import 'swiper/swiper-bundle.css';

const mySwiper = () => {
//initialize swiper when document ready
  if (document.querySelector('.swiper-container')) {
    new Swiper ('.swiper-container', {
      // Optional parameters
      direction: 'horizontal',
      slidesPerView: 1,
      loop: false,
      centeredSlidesBounds: true,

      // If we need pagination
      pagination: {
        el: '.swiper-pagination',
      },

      // And if we need scrollbar
      scrollbar: {
        el: '.swiper-scrollbar',
      },
    })
  }
}
export { mySwiper };
