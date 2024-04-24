document.addEventListener("DOMContentLoaded", function() {
  const images = [
    'tile_p1.png',
    'tile_p2.png',
    'tile_p3.png'
  ];

  const tilesContainer = document.createElement('div');
  tilesContainer.id = 'tiles-container';
  document.body.appendChild(tilesContainer);

  images.forEach(image => {
    let img = new Image();
    img.src = `/images/${image}`;
    img.classList.add('tile-image'); // CSSクラスを追加
    img.dataset.tileId = image.split('.')[0]; // tile_p1からIDを抽出
    tilesContainer.appendChild(img);
  });

  tilesContainer.addEventListener('click', function(event) {
    event.preventDefault();
    const tileId = event.target.dataset.tileId;
    if (tileId) {
      console.log('Selected Tile ID:', tileId);
      // ここで選択された牌のIDをフォームに設定するなどの処理を行う
    }
  });
});