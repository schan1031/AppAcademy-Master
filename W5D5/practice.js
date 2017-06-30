document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('myCanvas')
  let ctx = canvas.getContext('2d')

  // ctx.fillStyle = 'rgb(200,0,0)'; // sets the color to fill in the rectangle with
  // ctx.fillRect(10, 10, 55, 50);   // draws the rectangle at position 10, 10 with a width of 55 and a height of 50
  ctx.beginPath()
  ctx.strokeStyle = 'blue'

  ctx.arc(150, 150, 75, 0, 2*Math.PI, false)
  ctx.stroke()
  ctx.fillStyle = 'rgb(200,20,100)'
  ctx.fill()

});
