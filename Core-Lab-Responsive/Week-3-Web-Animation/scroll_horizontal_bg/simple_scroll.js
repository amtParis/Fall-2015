
var $window = $(window);	
var lastScrollTop = 0;
var bgX = 0;

$window.on('scroll', do_horizontal_scroll);

// scroll function
function do_horizontal_scroll() {
	
	var window_top_position = $window.scrollTop();

   	bgX += (window_top_position-lastScrollTop);
    lastScrollTop = window_top_position;
	var result = bgX + "px 0px";
	$('#part-1').css('background-position',result);

}	
