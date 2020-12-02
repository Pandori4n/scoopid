import Swiper from 'swiper/bundle';

const mySwiper = () => {
  //initialize swiper when document ready
  if (document.querySelector('.swiper-container')) {
    new Swiper('.swiper-container', {
      pagination: {
        el: '.swiper-pagination',
        // type: 'bullets',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
  }
}
export { mySwiper };
