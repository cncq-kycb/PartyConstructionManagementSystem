$(function(){
	"use strict";

	// preloader
	$(".loader-wrapper").fadeOut();

	// sidebar
	$(".sidebar").sideNav({
		edge: "left"
	});

	// navbar on scroll
    $(window).on("scroll", function() {

        if ($(document).scrollTop() > 50) {

            $(".navbar").css({
                "box-shadow": "rgba(0, 0, 0, .13) 0px 0px 13px"
            });

        } else {

            $(".navbar").css({
                "box-shadow": "none"
            });

        }

    });

    // navbar on scroll
    $(window).on("scroll", function() {

        if ($(document).scrollTop() > 50) {

            $(".navbar-features").css({
                "box-shadow": "rgba(0, 0, 0, .13) 0px 0px 13px",
                "background": "#fff"
            });

        } else {

            $(".navbar-features").css({
                "box-shadow": "none",
                "background": "transparent"
            });
        }

    });

    // navbar on scroll
    $(window).on("scroll", function() {

        if ($(document).scrollTop() > 50) {

            $(".navbar-pricing").css({
                "box-shadow": "rgba(0, 0, 0, .13) 0px 0px 13px",
                "background": "#fff"
            });

        } else {

            $(".navbar-pricing").css({
                "box-shadow": "none",
                "background": "transparent"
            });
        }

    });

	// slider
	$(".slider-slide").owlCarousel({
		items: 1,
		slideSpeed: 1000,
		dots: true,
		paginationSpeed: 400,
		singleItem: true,
		loop: true,
		margin: 10
	});

	// popular course
	$(".popular-slide").owlCarousel({
		items: 1,
		loop: false,
		margin: 15
	});

	// tabs
	$("ul.tabs").tabs();

	// modal
	$(".modal").modal({
		dismissible: false
	});

	// testimonial
	$(".testimonial-slide").owlCarousel({
		items: 1,
		loop: false
	});

});