const addClassAccordion = () => {
  // var buttonAccordion = document.querySelectorAll('btn-link');
  var arrows = document.querySelectorAll(".arrow-down-accordion");
  if (arrows) {
    arrows.forEach((arrow) => {
      arrow.addEventListener('click', (event) => {
        arrow.classList.toggle("fa-chevron-down");
        arrow.classList.toggle("fa-chevron-up");
      })
    })
  }
};

export { addClassAccordion };
