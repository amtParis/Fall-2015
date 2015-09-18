// store the class that I want fade applied to in a variable
var $animation_elements = $('.animation-element');

// store window object in variable
var $window = $(window);	

// get all possible scrolling
$window.on('scroll', do_scroll);
$window.on('scroll resize', do_scroll);
$window.trigger('scroll');


// scroll function
function do_scroll() {
	
	// get window parameters
	var window_height = $window.height();
	var window_top_position = $window.scrollTop();
	var window_bottom_position = (window_top_position + window_height);


    // loop through all that have animation-element class
	$.each($animation_elements, function() {
	    
	    var $element = $(this);
	    var element_height = $element.outerHeight();
	    var element_top_position = $element.offset().top;
	    var element_bottom_position = (element_top_position + element_height);

	    // calculate opacity based on distance to center viewport window
	    var window_half= window_height*.5;
	    var window_half_pos = window_top_position + window_half;
	    var element_middle = element_top_position+element_height*.5;
	    
	    var scrollPercent = 1 - (Math.abs(element_middle-window_half_pos) / window_half );
	    
	    // keep percent between 0 and 1
	    scrollPercent = Math.max(scrollPercent,0);
	    scrollPercent = Math.min(scrollPercent,1);

	    // apply percent to css opacity property
    	$element.css('opacity', scrollPercent);
    	
    	
	});
}	
