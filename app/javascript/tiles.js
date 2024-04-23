document.addEventListener("DOMContentLoaded", function() {
  const images = [
    'tile_p1.png',
    'tile_p2.png',
    'tile_p3.png'
  ];

  images.forEach(image => {
    let img = new Image();
    img.src = `/images/${image}`;
    document.body.appendChild(img);
  });
});