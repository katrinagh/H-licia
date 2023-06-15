import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    userMarker: Object,
    orderMarker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.addMarkersToMapUser()
    this.addMarkersToMapOrder()
    this.fitMapToMarkers()

    setTimeout(() => {
      // Obtenir l'horodatage de départ
      this.startTime = performance.now();
      requestAnimationFrame(this.animateMarker.bind(this));
    }, 7000);
  }


  addMarkersToMapUser() {
    const popup = new mapboxgl.Popup().setHTML(this.userMarkerValue.info_window_html)
    const customMarker = document.createElement("div")
    customMarker.innerHTML = this.userMarkerValue.marker_html
    new mapboxgl.Marker(customMarker)
      .setLngLat([this.userMarkerValue.lng, this.userMarkerValue.lat])
      .setPopup(popup)
      .addTo(this.map)
  }

  addMarkersToMapOrder() {
    const popup = new mapboxgl.Popup().setHTML(this.orderMarkerValue.info_window_html)
    const customMarker = document.createElement("div")

    customMarker.innerHTML = this.orderMarkerValue.marker_html
    this.orderMarker = new mapboxgl.Marker()
      .setLngLat([this.orderMarkerValue.lng, this.orderMarkerValue.lat])
      .setPopup(popup)
      .addTo(this.map)

  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    const markersValue = [this.userMarkerValue, this.orderMarkerValue]
    markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70 })
  }

  // Define the animation.
  animateMarker(timestamp) {
    // Définir les coordonnées du point de départ (A) et du point d'arrivée (B)
    // A = Order
    const startLng = 6.632351;
    const startLat = 46.517983;
    // B = User
    const endLng = 6.57538;
    const endLat = 46.525021;

    // Démarrer l'animation

    const startPoint = [startLng, startLat]; // Point A (coordonnées du point de départ)
    const endPoint = [endLng, endLat]; // Point B (coordonnées du point d'arrivée)
    const duration = 25000; // Durée de l'animation en millisecondes - 32secondes
    const progress = Math.min((timestamp - this.startTime) / duration, 1); // Calculer la progression de l'animation

    const relative_progress = easeInOutCubic(progress)

    // Calculer les coordonnées du marqueur en fonction de la progression
    const lng = startPoint[0] + (endPoint[0] - startPoint[0]) * relative_progress;
    const lat = startPoint[1] + (endPoint[1] - startPoint[1]) * relative_progress;

    this.orderMarker.setLngLat([lng, lat]); // Mettre à jour la position du marqueur

    this.orderMarker.addTo(this.map); // S'assurer que le marqueur est ajouté à la carte

    // Vérifier si l'animation doit se poursuivre
    if (progress < 1) {
      // Demander le prochain frame de l'animation
      requestAnimationFrame(this.animateMarker.bind(this));
    }
  }

}

function easeInOutCubic(x) {
  return x < 0.5 ? 4 * x * x * x : 1 - Math.pow(-2 * x + 2, 3) / 2;
}
