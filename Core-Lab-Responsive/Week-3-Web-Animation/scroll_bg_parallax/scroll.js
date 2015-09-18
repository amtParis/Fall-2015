
var $window = $(window);	

$window.on('scroll', do_scroll);
$window.on('scroll resize', do_scroll);
$window.trigger('scroll');

function do_scroll() {
		

	$('*[data-type="background"]').each(function(){
        
        var $bgobj = $(this); // assigning the object
        var yPos = -($window.scrollTop() / $bgobj.data('speed'));
        var coords = '50% '+ yPos + 'px';
        
        // Move the background
        $bgobj.css({ backgroundPosition: coords });
    
    });

}	