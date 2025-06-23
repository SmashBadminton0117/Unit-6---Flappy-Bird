void EndingScreen() {

  //background GIF for the EndingScreen
  backgroundOfCityViews();

  //Fonts + textAlign CENTER:
  textAlign(CENTER);
  textFont(FontsFlappy);


  // TITLE OF THE ENDING SCREEN:
  fill(255, 0, 0, 177);
  textSize(377);
  text("GAME OVER", width / 2, height / 2 - 50);

  // Show score:
  fill(255, 255, 255);
  textSize(47);
  text("Score " + points, width / 2, height / 2 + 20);

  // Click to restart:
  fill(0, 0, 0);
  textSize(67);
  text("Click to Restart", width / 2, height / 2 + 150);
}

