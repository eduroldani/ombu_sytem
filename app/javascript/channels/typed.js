console.log("Hello typed")
//= require lib/typed
// Can also be included with a regular script tag
import Typed from 'typed.js';

var options = {
  strings: ['<i>First</i> sentence.', '&amp; a second sentence.'],
  typeSpeed: 40
};

var typed = new Typed('.element', options);


