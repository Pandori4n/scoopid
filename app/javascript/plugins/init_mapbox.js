import mapboxgl from 'mapbox-gl';

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  [markers].forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  };
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/satellite-v9'
    });
    const markers = JSON.parse(mapElement.dataset.markers);
    const itineraries = JSON.parse(mapElement.dataset.itineraries);
    [markers].forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
    });
    fitMapToMarkers(map, markers);
    let i = 0;
    itineraries.forEach((itinerary) => {
      // console.log(i);
      map.on('load', function () {
        map.addSource(`route-${i}`, {
          'type': 'geojson',
          'data': {
            'type': 'Feature',
            'properties': {},
            'geometry': {
              'type': 'LineString',
              'coordinates': itinerary
            }
          }
        });
        map.addLayer({
          'id': `route-${i}`,
          'type': 'line',
          'source': `route-${i}`,
          'layout': {
            'line-join': 'round',
            'line-cap': 'round'
            },
          'paint': {
            'line-color': '#888',
            'line-width': 8
          }
        });
      });
      i++
    });
  }
};

export { initMapbox };
