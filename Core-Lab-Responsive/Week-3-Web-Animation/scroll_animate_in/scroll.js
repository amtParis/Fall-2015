
var $window = $(window);	

$window.on('scroll', do_scroll);
$window.on('scroll resize', do_scroll);
$window.trigger('scroll');

function do_scroll() {
		
	var window_height = $window.height();
	var window_top_position = $window.scrollTop();
	var window_bottom_position = (window_top_position + window_height);

	console.log(window_top_position);

	// animate rotations
	$('*[class="rotate"]').each(function(){
		var $element = $(this);
		var endPosition = $element.data('end');
		if(window_top_position < endPosition ){
			var percent = window_top_position / endPosition;
			var y = -180 * percent;
			$element.css({transform:'rotate('+y+'deg)'});
		}
	});

	// animate left ins
	$('*[class="left-in"]').each(function(){
		var $element = $(this);
		var startPosition = $element.data('start');
		var endPosition = $element.data('end');
		var duration= $element.data('duration');
		
		if(window_top_position < endPosition ){
			var percent = (window_top_position-startPosition) / duration;
			var left = 100 * (1-percent);
			left = Math.min(left,100);
			left = Math.max(left,0);

			$element.css('left',left+'%');
		}else if(window_top_position  > endPosition){
			var percent = (window_top_position-endPosition) / duration;
			var left = 100 * (percent);
			$element.css('left',left+'%');
		}
	});


	// animate fade ins
	$('*[class="fade-in"]').each(function(){
		var $element = $(this);
		var startPosition = $element.data('start');
		var endPosition = $element.data('end');
		var duration= $element.data('duration');
		
		if(window_top_position < endPosition ){
			var percent = (window_top_position-startPosition) / duration;
			var fade =  percent;
			fade = Math.min(fade,1);
			fade = Math.max(fade,0);

			$element.css('opacity',fade);
		}else if(window_top_position  > endPosition){
			var fade = (window_top_position-endPosition) / duration;
			$element.css('opacity',1-fade);
		}
	});

	

}	