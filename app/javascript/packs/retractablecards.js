const addClass = () => {

  var arrow = document.getElementById("arrow-down-retractable");
  var buttonDisplay = document.getElementById("card-button-display");
  if (arrow) {
    arrow.addEventListener('click', (event) => {
      buttonDisplay.classList.toggle("display-none");
      arrow.classList.toggle("fa-chevron-down");
      arrow.classList.toggle("fa-chevron-up");
    })
  }
};

export { addClass };
