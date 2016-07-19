draw = function (chartType, travel, result, accomodation, bus, meal, activities, train, taxi, shopping, kidsMeal) {


    var chart = new CanvasJS.Chart("chartContainer",
	{
        title: {
	        text: "The budget for " + travel + " is: " + result,
	    },
	    animationEnabled: true,
	    legend: {
	        verticalAlign: "center",
	        horizontalAlign: "left",
	        fontSize: 20,
	        fontFamily: "Helvetica"
	    },
	    theme: "theme2",
	    data: [
		{
		    type: chartType,
		    indexLabelFontFamily: "Garamond",
		    indexLabelFontSize: 20,
		    indexLabel: "{label} {y}%",
		    startAngle: -20,
		    dataPoints: [
				{ y: accomodation, label: "Accomodation" },
				{ y: taxi, label: "Taxi" },
				{ y: bus,  label: "Bus" },
				{ y: train, label: "Train" },
		        { y: shopping, label: "Shopping" },
	            { y: activities, label: "Activities" },
                { y: meal, label: "Meal" },
                { y: kidsMeal, label: "Kids Meal" }
		    ]
		}
	    ]
	});
    chart.render();
}