void StartingScreen() {

  backgroundOfCityViews();
  
  textAlign(CENTER);
  textFont(FontsFlappy);


  //TITLE OF THE STARTING SCREEN:
  fill(255, 255, 255, 150);
  textSize(277);
  text("FLAPPY BIRD", width / 2, height / 2 - 50);

  //Button:
  fill(0, 0, 0, 170);
  textSize(48);
  text("Click to Start", width / 2, height / 2 + 120);
  
}
