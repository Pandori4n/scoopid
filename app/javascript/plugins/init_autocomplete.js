import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelector('.search_party_meeting_location #search_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
