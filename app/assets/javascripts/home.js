// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){
  $('.single-item').slick();
  $('.slider-responsive').slick({
    slidesToShow: 2,
    centerMode: true,
    responsive: [
      {
        breakpoint: 576,
        settings: {
          slidesToShow: 1,
          arrows: false
        }
      }
    ]
  });
});
