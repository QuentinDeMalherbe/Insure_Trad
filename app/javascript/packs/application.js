// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { memePersonne, pasMemePersonne } from '../components/button';
import { changeSelect } from '../pages/comparaison';
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  console.log(document.getElementById('comparaison') !== null);
  if (document.getElementById('comparaison') !== null) {
    const select = document.getElementById('grade_a');
    select.addEventListener('change', () => {
      changeSelect(select.value)
    });
  };
  if (document.getElementById('dirigeant') !== null) {
    const dirigeant = document.getElementById('dirigeant');
    dirigeant.addEventListener('change', () => {
      if (document.getElementById('dirigeant').checked) {
        memePersonne('dirigeant');
      } else {
        pasMemePersonne('dirigeant');
      }
    });
  };

  if (document.getElementById('correspondance') !== null) {
    const dirigeant = document.getElementById('correspondance');
    dirigeant.addEventListener('change', () => {
      if (document.getElementById('correspondance').checked) {
        memePersonne('correspondance');
      } else {
        pasMemePersonne('correspondance');
      }
    });
  };
});



