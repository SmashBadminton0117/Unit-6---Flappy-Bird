void StartingScreen() {

  //background GIF for the StartingScreen
  backgroundOfCityViews();
  
  //Fonts + textAlign CENTER:
  textAlign(CENTER);
  textFont(FontsFlappy);


  //TITLE OF THE STARTING SCREEN:
  fill(255, 255, 255, 150);
  textSize(317);
  text("FLAPPY BIRD", width / 2, height / 2 - 50);

  //Button:
  fill(0, 0, 0);
  textSize(48);
  text("Click to Start", width / 2, height / 2 + 120);
  
}
