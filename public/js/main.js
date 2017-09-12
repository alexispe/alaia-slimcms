(function ($) {
"use strict";


	/* Preloader */
	var win = $(window);
	win.on('load',function() {
		$('.page-loader').delay(350).fadeOut('slow');
	});

	/* meanmenu */
	 $('#mobile-nav').meanmenu({
		 meanMenuContainer: '.mobile-menu',
		 meanScreenWidth: "767"
	 });

    /* TOP Menu Stick  */
	win.on('scroll',function() {
	if ($(this).scrollTop() > 1){
		$('#sticky-header').addClass("sticky");
	  }
	  else{
		$('#sticky-header').removeClass("sticky");
	  }
	});

   /*-- One Page Nav -*/
    var top_offset = $('.header-middle').height() - 20
    $('.onepage-nav').onePageNav({
        currentClass: 'active',
        scrollOffset: top_offset,
    });

	/* hamburgers menu option  */
    $('.hamburger').on('click', function() {
        $(this).toggleClass('is-active');
        $(this).next().toggleClass('nav-menu-show')
    });


	/*Portfolio Grid*/
	$('.grid').imagesLoaded( function() {

	var $grid = $('.grid').isotope({
	  itemSelector: '.grid-item',
	  percentPosition: true,
	  masonry: {
	// use outer width of grid-sizer for columnWidth
		columnWidth: '.grid-item'
	  }
	})

	// filter items on button click
	$('.portfolio-menu').on( 'click', 'button', function() {
	  var filterValue = $(this).attr('data-filter');
	  $grid.isotope({ filter: filterValue });
	});

	});

	/* for active class in filter menu  */
	$('.portfolio-menu button').on('click', function(event) {
		$(this).siblings('.active').removeClass('active');
		$(this).addClass('active');
		event.preventDefault();
	});

    //    Counter UP
    $('.counter').counterUp({
        delay: .8,
        time: 150
    });

    //    WOW JS
    new WOW().init();

    //Paralax Js
    $.stellar();

    /* magnificPopup video view */
	$('.popup-video').magnificPopup({
		type: 'iframe'
	});

	/* main-slider */
	$('.slider-active').owlCarousel({
		loop:true,
		navText:['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
		nav:true,
		animateOut: 'fadeOut',
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:1
			}
		}
	})


    /* testimonial-slider */
	$('.testimonial-active').owlCarousel({
		loop:true,
		navText:['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
		nav:false,
		autoplay:true,
		responsive:{
			0:{
				items:1
			},
			450:{
				items:1
			},
			768:{
				items:1
			},
			1000:{
				items:1
			}
		}
	})
 	/* Client-slider */
	$('.clients-active').owlCarousel({
		loop:true,
		navText:['<i class="fa fa-angle-left"></i>', '<i class="fa fa-angle-right"></i>'],
		nav:true,
		autoplay:true,
		animateOut: 'fadeOut',
		responsive:{
			0:{
				items:2
			},
			450:{
				items:3
			},
			768:{
				items:6
			},
			1000:{
				items:6
			}
		}
	})

    /* Scroll Up */

	$.scrollUp({
		scrollName: 'scrollUp', // Element ID
		topDistance: '300', // Distance from top before showing element (px)
		topSpeed: 300, // Speed back to top (ms)
		animation: 'fade', // Fade, slide, none
		animationInSpeed: 1000, // Animation in speed (ms)
		animationOutSpeed: 1000, // Animation out speed (ms)
		scrollText: '<i class="fa fa-angle-up"></i>', // Text for element
	});

	// Select all links with hashes
$('a[href*="#"][smoothscroll]')
  // Remove links that don't actually link to anything
  .not('[href="#"]')
	.not('[href="#0"]')
  .click(function(event) {
    // On-page links
    if (
      location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
      &&
      location.hostname == this.hostname
    ) {
      // Figure out element to scroll to
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      // Does a scroll target exist?
      if (target.length) {
        // Only prevent default if animation is actually gonna happen
        event.preventDefault();
        $('html, body').animate({
          scrollTop: target.offset().top
        }, 1000, function() {
          // Callback after animation
          // Must change focus!
          var $target = $(target);
          $target.focus();
          if ($target.is(":focus")) { // Checking if the target was focused
            return false;
          } else {
            $target.attr('tabindex','-1'); // Adding tabindex for elements not focusable
            $target.focus(); // Set focus again
          };
        });
      }
    }
  });

	$('.open-popup-link').magnificPopup({
	  type:'inline',
	  midClick: true // Allow opening popup on middle mouse click. Always set it to true if you don't provide alternative source in href.
	});
})(jQuery);
