window.onload = function () {
    // Initialize CanvasJS chart with dynamic data
    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        title: {
            text: "Access by IP"
        },
        axisX: {
            title: "IP Address"
        },
        axisY: {
            title: "Number of Requests"
        },
        data: [{
            type: "column",
            dataPoints: chartData
        }]
    });

    chart.render();

    // Initialize Leaflet map
    var map = L.map('map').setView([0, 0], 2);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
    }).addTo(map);

    // Mark IP addresses on the map
    var markers = [];
    chartData.forEach(function (data) {
        // Use a free IP geolocation service or your own API to get latitude and longitude for each IP address
        // Here, we use dummy coordinates (0, 0) for demonstration purposes
        var latLng = [0, 0];
        markers.push(L.marker(latLng).addTo(map).bindPopup(data.label + ": " + data.y + " requests"));
    });

    // Fit map bounds to markers
    var group = new L.featureGroup(markers);
    map.fitBounds(group.getBounds());
};
