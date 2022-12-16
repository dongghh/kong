$(document).ready(function () {

  //main slide
  var main_swiper = new Swiper(".main-slide", {
    slidesPerView: 1,
    loop: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });

  //best slide
  var best_swiper = new Swiper(".best-slide", {
    slidesPerView: 1,
    loop: true,
    pagination: {
      el: ".swiper-pagination",
      clickable: true,
    },
  });

  var sslide = new Swiper(".sslide", {
    cssMode: true,
    loop: true,
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
    pagination: {
      el: ".swiper-pagination",
    },
    mousewheel: true,
    keyboard: true,
  });

});

function selectAll(selectAll) {
  const checkboxes
    = document.getElementsByName('cart-content-select');

  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}