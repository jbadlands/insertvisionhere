document.observe("dom:loaded", function() {

	$('news-prev').observe('mouseover', function(event){
		
		new Effect.Move($('news_content'),{x: 0, y: 100, duration: 1, mode:'relative'})
		
		//Event.stop(event);
	});
	
	$('news-prev').observe('mouseout', function(event){
		
		//new Effect.Move($('news_content'),{x: 0, y: 10, duration: 1, mode:'relative'})
		
		Event.stop(event);
	});
	
	$('news-next').observe('mouseover', function(event){

		new Effect.Move($('news_content'),{x: 0, y: -100, duration: 1, mode:'relative'})
		//Event.stop(event);
	});
	
	$('news-next').observe('mouseout', function(event){
		
		//new Effect.Move($('news_content'),{x: 0, y: 10, duration: 1, mode:'relative'})
		
		Event.stop(event);
	});
	

});
