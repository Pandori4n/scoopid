import flatpickr from "flatpickr";

  const flatpicker = () => {
    flatpickr(".datepicker", {});
    flatpickr(".hourpicker", {enableTime: true, noCalendar: true});
  }

export { flatpicker };
