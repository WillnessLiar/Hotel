/* GitHub: https://github.com/peet86/Ratyli */

$(function() {
	// Default
	/*$("#demo1 .ratyli").ratyli();

	// Configure with Datasets
	$("#demo2 .ratyli").ratyli();

	// Configure with JS
	$("#demo3 .ratyli").ratyli({rate:3,max:7});

	// Custom Signs
	$("#demo4 .ratyli").ratyli();

	// Font Awesome Signs
	$("#demo5 .ratyli").ratyli({
		full:"<i class='fa fa-thumbs-up'></i>",
		empty:"<i class='fa fa-thumbs-o-up'></i>",
	});
*/

	// Rated Callback
	$("#demo6 .ratyli").ratyli({
		onRated:function(value,init){
			// rating callback
			/*if(!init) alert(value);*/
			if(value==1)$("#level").text("非常差");
			else if(value==2)$("#level").text("差");
			else if(value==3)$("#level").text("一般");
            else if(value==4)$("#level").text("好");
            else if(value==5)$("#level").text("非常好");
            else $("#level").text("");
			$("#level").val(value);  // prevent run at init
			$("#start").val(value);
		}
	});


	// Sign Callbacks:
	/*$("#demo7 .ratyli").ratyli({
		onSignClick:function(value,target){
			// sign click event callback
			alert("clicked: "+target);
		},
		onSignEnter:function(value,target){
			// sign mouseenter event callback
			console.log("enter : "+value);
		},
		onSignLeave:function(value,target){
			// sign mouseleave event callback
			console.log("leave : "+target);
		},
	});

	// Custom cursor
	$("#demo8 .ratyli").ratyli({cursor:"crosshair"});

	// Disabled
	$("#demo9 .ratyli").ratyli({disable:true});

	// Unrateable
	$("#demo10 .ratyli").ratyli({unrateable:true});*/


});