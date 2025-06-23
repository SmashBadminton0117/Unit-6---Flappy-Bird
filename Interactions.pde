void keyPressed() {
  if (key == ' ' || key == ' ') spaceKey = true;

  //Pause to start
  if (key == ' ' && mode == WaitingToStart) {
    mode = FlappyBirdGame;
    VelocityOfFlappyBirdY = -15;
    flying.play();
  } else if (key == ' ' && mode == FlappyBirdGame) {
    VelocityOfFlappyBirdY = -15;
    flying.play();
  }
}



void keyReleased() {
  if (key == ' ') spaceKey = false;
}



void mousePressed() {
  //Starting Screen mousePressed: ===================================================================
  if (mode == StartingScreen) {
    mode = WaitingToStart;
    FlappyBirdX = width / 2;
    FlappyBirdY = height / 2;
    VelocityOfFlappyBirdY = 0;
    
  } else if (mode == WaitingToStart) {
    mode = FlappyBirdGame;
    VelocityOfFlappyBirdY = -15;
    flying.play();
    
  } else if (mode == FlappyBirdGame) {
    VelocityOfFlappyBirdY = -15;
    flying.play();
    
  } else if (mode == EndingScreen) {
    resetGameFunction();
    
  } //ends here: =====================================================================================
} //mousedPressed for the jumps + the movements: -----------------------------------------------------



// flappyBirdMovements starts here:
void flappyBirdMovements() {
  //spaceKey for Interactions:
  if ( spaceKey == true ) VelocityOfFlappyBirdY = -9;
} // end of flappyBirdMovements: -----------------------------------------------------------------------



void collisionOfFlappyBirdAndGround() {
  //Collision with top
  if (FlappyBirdY < -300) {
    FlappyBirdY = -270;
    VelocityOfFlappyBirdY = 0;
  }

  //Collision with ground:
  if (FlappyBirdY + FlappyBird.height >= height) {
    FlappyBirdY = height - FlappyBird.height;
    VelocityOfFlappyBirdY = 0;
    dying.play();
    mode = EndingScreen;
  }
}
