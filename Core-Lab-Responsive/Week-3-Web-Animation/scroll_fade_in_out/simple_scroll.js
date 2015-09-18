
var $animation_elements = $('.animation-element');
var $window = $(window);	

$window.on('scroll', do_scroll);
$window.on('scroll resize', do_scroll);
$window.trigger('scroll');

// adjust padding on first and last to be centered	
var window_height = $window.height();
var $element = $('#part-1'); 
var element_height = $element.outerHeight();
$element.css('padding-top',($window.height()-element_height)*.5);

// adjust padding on last element I want centered
$element = $('#part-6'); 
element_height = $element.outerHeight();
var new_padding= ($window.height()-element_height*.5)*.5;
$element.css('padding-bottom',new_padding);


// scroll function
function do_scroll() {
	
	// get window parameters
	var window_height = $window.height();
	var window_top_position = $window.scrollTop();
	var window_bottom_position = (window_top_position + window_height);

	// make fade in background at given height
    if(window_top_position > 1920){
    	$("div").addClass('darkness');
    }else{
    	$("div").removeClass('darkness');
    }

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
	    scrollPercent = Math.max(scrollPercent,0);
	    scrollPercent = Math.min(scrollPercent,1);

    	if(scrollPercent >= 0){
        	$element.css('opacity', scrollPercent);
    	}

    	
	    // check to see if this current container is within viewport
	    // add or remove in-view class to element
	    if ((element_top_position >= window_top_position) &&
	        (element_bottom_position <= window_bottom_position)) {
	  		$element.addClass('in-view');
	    } else {
	      	$element.removeClass('in-view');
	    }
	});
}	
