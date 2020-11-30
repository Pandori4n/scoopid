import mapboxgl from 'mapbox-gl';

const initMapboxShow = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  [markers].forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };
  if (mapElement && mapElement.dataset.itinerary) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/basilerieu/cki0d8i2q1hw819lrdus9xnyx'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    const itinerary = JSON.parse(mapElement.dataset.itinerary);
    const color = JSON.parse(mapElement.dataset.color);
    [markers].forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    map.on('load', function () {
      let data = {
        type: "FeatureCollection",
        features:[
          {
            type: "Feature",
            geometry:{
              type: "LineString",
              coordinates: itinerary
            }
          }
        ]
      };

      // let coordinates = itinerary;
      // coordinates = [coordinates[0]];
      console.log(data.features[0].geometry.coordinates);
      var coordinates = data.features[0].geometry.coordinates;
      const coordinatesLength = coordinates.length;
      data.features[0].geometry.coordinates = [coordinates[0]];
      console.log(data.features[0].geometry.coordinates);

      map.addSource('trace', { type: 'geojson', data: data });
      map.addLayer({
        'id': 'trace',
        'type': 'line',
        'source': 'trace',
        'paint': {
        'line-color': '#0e8b8d',
        'line-opacity': 0.75,
        'line-width': 5
        }
      });
      map.jumpTo({ 'center': coordinates[0], 'zoom': 14 });
      map.setPitch(30);
      var i = 0;
      var timer = window.setInterval(function () {
        console.log(coordinates.length);
        if (i < coordinatesLength) {
          coordinates.push(coordinates[i]);
          console.log(coordinates);
          data.features[0].geometry.coordinates.push(
          coordinates[i]
          );
          map.getSource('trace').setData(data);
          map.panTo(coordinates[i]);
          i++;
          console.log(i);
        } else {
          window.clearInterval(timer);
        }
      }, 2000);
    });
  };
};

export { initMapboxShow };
