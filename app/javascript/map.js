let map;

async function initMap() {
  let position;
  
  if (typeof gon !== 'undefined' && gon.bookstore_lat && gon.bookstore_lng) {
    position = { lat: gon.bookstore_lat, lng: gon.bookstore_lng };
  } else {
    position = { lat: -25.344, lng: 131.031 };
  }

  const { Map } = await google.maps.importLibrary("maps");
  const { AdvancedMarkerElement } = await google.maps.importLibrary("marker");

  // 地図の初期化
  map = new Map(document.getElementById("map"), {
    zoom: 15,
    center: position,
    mapId: "DEMO_MAP_ID",
  });

  // マーカーの初期化
  const marker = new AdvancedMarkerElement({
    map: map,
    position: position,
  });
}

initMap();