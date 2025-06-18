void FlappyBirdGame() {
  //background GIF:
  backgroundOfCityViews();

  //flappyBird Gravity:
  flappyBird();

  //Different Pipes
  drawAndMovePipes();

  //spaceBar movements:
  flappyBirdMovements();
  
  //Points system:
  textFont(FontsFlappy);
  textSize(70);
  text("POINTS", width / 2 + 400, 70);
  textFont(DefaultFont);
  textSize(40);
  text(":", width / 2 + 470, 63);
  text(points, width / 2 + 500, 65);

}
