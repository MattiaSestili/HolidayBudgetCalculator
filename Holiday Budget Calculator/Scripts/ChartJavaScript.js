draw = function (chartType, travel, result, flight, accomodation, bus, meal, activities, train, taxi, shopping, kidsMeal) {

    var chart = new CanvasJS.Chart("chartContainer",
	{
        title: {
	        text: "The budget for " + travel + " is: £" + result,
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
                { label: "Flight", y: parseFloat(flight) },
		        { label: "Accomodation", y: parseFloat(accomodation) },
                { label: "Bus", y: parseFloat(bus) },
                { label: "Meal", y: parseFloat(meal) },
                { label: "Activities", y: parseFloat(activities) },
                { label: "Train", y: parseFloat(train) },
                { label: "taxi", y: parseFloat(taxi) },
                { label: "Shopping", y: parseFloat(shopping) },
                { label: "Kids Meal ", y: parseFloat(kidsMeal) }



                //{ y: flight, label: "Flight" },
				//{ y: accomodation, label: "Accomodation" },
				//{ y: bus, label: "Bus" },
				//{ y: meal,  label: "Meal" },
				//{ y: activities, label: "Activities" },
		        //{ y: train, label: "Train" },
	            //{ y: taxi, label: "Taxi" },
                //{ y: shopping, label: "Shopping" },
                //{ y: kidsMeal, label: "Kids meal" }
		    ]
		}
	    ]
	});
    chart.render();
}