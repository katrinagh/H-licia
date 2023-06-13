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
    console.log(this.userMarkerValue)
    console.log(this.orderMarkerValue)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkersToMapUser()
    this.#addMarkersToMapOrder()
    this.#fitMapToMarkers()
  }

  #addMarkersToMapUser() {
    const popup = new mapboxgl.Popup().setHTML(this.userMarkerValue.info_window_html)
    const customMarker = document.createElement("div")
    customMarker.innerHTML = this.userMarkerValue.marker_html
    new mapboxgl.Marker(customMarker)
      .setLngLat([this.userMarkerValue.lng, this.userMarkerValue.lat])
      .setPopup(popup)
      .addTo(this.map)
  }

  #addMarkersToMapOrder() {
    const popup = new mapboxgl.Popup().setHTML(this.orderMarkerValue.info_window_html)
    const customMarker = document.createElement("div")
    customMarker.innerHTML = this.orderMarkerValue.marker_html
    new mapboxgl.Marker()
      .setLngLat([this.orderMarkerValue.lng, this.orderMarkerValue.lat])
      .setPopup(popup)
      .addTo(this.map)

    // Define the animation.
    function animateMarker(timestamp) {
      const startPoint = [startLng, startLat]; // Point A (coordonnées du point de départ)
      const endPoint = [endLng, endLat]; // Point B (coordonnées du point d'arrivée)
      const duration = 32000; // Durée de l'animation en millisecondes - 32secondes
      const progress = Math.min((timestamp - startTime) / duration, 1); // Calculer la progression de l'animation

      // Calculer les coordonnées du marqueur en fonction de la progression
      const lng = startPoint[0] + (endPoint[0] - startPoint[0]) * progress;
      const lat = startPoint[1] + (endPoint[1] - startPoint[1]) * progress;

      marker.setLngLat([lng, lat]); // Mettre à jour la position du marqueur

      marker.addTo(map); // S'assurer que le marqueur est ajouté à la carte

      // Vérifier si l'animation doit se poursuivre
      if (progress < 1) {
        // Demander le prochain frame de l'animation
        requestAnimationFrame(animateMarker);
      }
    }
    // Définir les coordonnées du point de départ (A) et du point d'arrivée (B)
    // A = Order
    const startLng = 6.632351;
    const startLat = 46.517983;
    // B = User
    const endLng = 6.57538;
    const endLat = 46.525021;

    // Obtenir l'horodatage de départ
    const startTime = performance.now();

    // Démarrer l'animation
    requestAnimationFrame(animateMarker);

  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    const markersValue = [this.userMarkerValue, this.orderMarkerValue]
    markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 270, maxZoom: 12, duration: 0 })
  }
}
