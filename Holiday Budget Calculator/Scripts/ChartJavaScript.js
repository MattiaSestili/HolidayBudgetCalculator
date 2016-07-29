draw = function (chartType, travel, result, flight, accomodation, bus, meal, activities, train, taxi, shopping, kidsMeal) {

    var chart = new CanvasJS.Chart("chartContainer",
	{
        title: {
	        text: "The budget for " + travel + " is: " + result + "£",
	    },
	    animationEnabled: true,
	    theme: "theme2",
	    data: [
		{
		    type: chartType,
		    indexLabelFontFamily: "Garamond",
		    indexLabelFontSize: 20,
		    indexLabel: "{label} £{y}",
		    startAngle: -20,
		    dataPoints: [
                { y: parseloat(flight), label: "Flight" },
				{ y: parseFloat(accomodation), label: "Accomodation" },
				{ y: parseFloat(bus), label: "Taxi" },
				{ y: parseFloat(meal),  label: "Bus" },
				{ y: parseFloat(activities), label: "Train" },
		        { y: parseFloat(train), label: "Shopping" },
	            { y: parseFloat(taxi), label: "Activities" },
                { y: parseFloat(shopping), label: "Meal" },
                { y: parseFloat(kidsMeal), label: "Kids Meal" }
		    ]
		}
	    ]
	});
    chart.render();
}