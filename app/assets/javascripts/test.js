$(document).ready(function() {
	// $("a.fancybox").fancybox();
	$("a[href$='.mp4'], a[href$='.jpg'],a[href$='.png'],a[href$='.gif']").attr('rel', 'gallery').fancybox();//makes every image on the site fancy!
	   
	$("#video-thumbnail").on('click',function(){
	    $.fancybox({
	    'width'             : '75%',
	    'height'            : '75%',
	    'autoScale'         : true,
	    'transitionIn'      : 'none',
	    'transitionOut'     : 'none',
	    'type'              : 'iframe',
	    'href'              : 'video.html'
	    });
	});
});
