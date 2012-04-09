(function(){
	var coffees_index = 0;
	var isDeveloping = true;
	var coffees = [
		'src/js/bsui__init.coffee',
		'src/js/bsui_button.coffee',
		'src/js/bsui_buttonGroup.coffee',
		'src/js/bsui_buttonDropdownMenu.coffee',
		'src/check/t88_check_main.coffee'
		];


	function runCoffees()
	{
		var num = new Date().getTime();
		if( coffees[coffees_index] ) {
			if(isDeveloping) {
				CoffeeScript.load( coffees[coffees_index] + "?a" + num, runCoffees);
			} else
				CoffeeScript.load( coffees[coffees_index], runCoffees);
			coffees_index ++;
		}
	}


	yepnope([
		{ test: !JSON, yep:"lib/js/_1_json2.js" },
		{ load: "lib/js/_2_jquery-1.7.2.js" },
		{ load: "lib/js/_3_underscore-1.3.1.js" },
		{ load: "lib/js/_4_backbone-0.9.2.js" },
		{ load: "lib/js/_5_bootstrap-2.0.2.min.js" },
		{
			load: "lib/js/_6_coffee-script-1.2.0.js",
			complete: runCoffees
		}
	]);
})();