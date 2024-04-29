document.addEventListener("DOMContentLoaded", function() {
  const button = document.getElementById('show-grid-button');
  const tilesContainer = document.getElementById('tiles-container');
  const selectedTile = document.getElementById('selected-tile');

  // ボタンがクリックされた時に画像グリッドを表示
  button.addEventListener('click', function() {
    tilesContainer.style.display = 'block'; // 画像グリッドを表示
  });

  // 牌の画像がクリックされた時の処理
  tilesContainer.addEventListener('click', function(event) {
    if (event.target.className === 'tile-image') {
      const imageSrc = event.target.src;
      selectedTile.innerHTML = `<img src="${imageSrc}" alt="Selected Tile" style="width: 100px;">`;
      tilesContainer.style.display = 'none'; // 画像グリッドを非表示
    }
  });
});