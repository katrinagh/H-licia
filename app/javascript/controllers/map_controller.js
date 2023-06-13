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
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    const markersValue = [this.userMarkerValue, this.orderMarkerValue]
    markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 270, maxZoom: 12, duration: 0 })
  }
}
