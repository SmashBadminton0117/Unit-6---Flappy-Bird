void keyPressed() {
  if (key == ' ' || key == ' ') spaceKey = true;

  //Pause to start
  if (key == ' ' && mode == WaitingToStart) {
    mode = FlappyBirdGame;
    Vfy = -15;
  } else if (key == ' ' && mode == FlappyBirdGame) {
    Vfy = -15;
  }
}

  void keyReleased() {
    if (key == ' ') spaceKey = false;
  }


  // flappyBirdMovements starts here:
  void flappyBirdMovements() {
    //spaceKey for Interactions:
    if ( spaceKey == true ) Vfy = -9;
  } // end of flappyBirdMovements: -----------------------------------------------------------------------
