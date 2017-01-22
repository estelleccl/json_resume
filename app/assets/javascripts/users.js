$(document).on('ready page:load',function(){
	$("form").on("change", ".upload", function(){ 
	    $(this).parent(".wrapper").attr("data-value",
	      $(this).val().replace(/.*(\/|\\)/, '') );
	});
});