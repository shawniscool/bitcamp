$(document).ready(function(){
	// $('h1').addClass('aaa');
	// alert("start");
	var myElement = document.getElementById('myElement');

	// create a simple instance
	// by default, it only adds horizontal recognizers
	var first = new Hammer(myElement);
	// listen to events...
	// emergency.add(new Hammer.Pan({direction: Hammer.DIRECTION_ALL }));
	// emergency.add(new Hammer.Pan({direction: Hammer.DIRECTION_LEFT }));

	first.add( new Hammer.Pan({ direction: Hammer.DIRECTION_ALL, threshold: 0 }) );
	first.add( new Hammer.Tap({ event: 'tap', taps: 1 }) );

	function panLeft(event){
		console.log(event.type);
		first.on("pandown",panDown);
		myElement.textContent = "left pan" +" gesture detected.";
	}

	function panDown(event){
		console.log(event.type);
		first.on("tap",emergency);
		myElement.textContent = "left pan and down pan" +" gesture detected.";
	}

	function emergency(event){
		console.log(event.type);
		myElement.textContent = "left pan, down pan and tap" +" gesture detected.";

		$.post('/alerts#create',
			{address:"500 College Ave",city:"Swarthmore"},
			function(){
				alert("create a new object");
			});

		// $.ajax({
		//     url: "/alerts",
		//     type: "POST",
		//     data: {alert: {
		//              address: "a", 
		//              city: "b",}},
		//     success: function(resp){alert("aa")}
		// });
		
		// $.ajax({
		// 	type:'POST', 
		// 	url: '/test', 
		// 	dataType: 'script',
		// 	data: { name: "aa", address:"bb"} ,
		// });


		// $.ajax({url:"/alerts/new",type:"POST",});
	}

	first.on("panleft", panLeft);


});
