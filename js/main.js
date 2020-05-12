$(document).ready(function() {
	// Expand publication
	$('.publication-read-more').on('click', function(e) {
        console.log('hello');
		$(this).toggleClass('hide');
		$(this).parent().children('.publication-text').toggleClass('expanded');
	});

});