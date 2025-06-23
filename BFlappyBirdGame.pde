// void draw starts here:
void draw() {
  if (mode == StartingScreen) {
    StartingScreen();

    //Spacekey to move into waiting screen:

    if ( spaceKey == true ) {
      mode = WaitingToStart;

      //"False" the spaceKey after usage
      spaceKey = false;
    }
  } else if (mode == WaitingToStart) {
    backgroundOfCityViews();

    //Offset of the Flappy Bird + waiting timer:
    float floatOffset = sin(waitingTimer) * 10;
    image(FlappyBird, FlappyBirdX, FlappyBirdY + floatOffset);
    waitingTimer += 0.05;

    //"False" the spaceKey after usage
    spaceKey = false;
  } else if (mode == FlappyBirdGame) {
    FlappyBirdGame();
  } else if (mode == EndingScreen) {
    EndingScreen();

    //Spacekey to move into waiting screen:
    if ( spaceKey == true ) {
      mode = StartingScreen;

      //"False" the spaceKey after usage
      spaceKey = false;

      resetGameFunction();
    }
  }
} // draw ends here: -----------------------------------------------------------------------------------



void FlappyBirdGame() {
  //background GIF:
  backgroundOfCityViews();

  //flappyBird Gravity:
  flappyBird();

  //Different Pipes
  drawAndMovePipes();

  //spaceBar movements:
  flappyBirdMovements();

  //Points system:‘
  fill(255, 255, 255, 150);
  textFont(FontsFlappy);
  textSize(70);
  text(":", width / 2 + 437, 75);
  text("POINTS  " + points, width / 2 + 400, 70);
  noFill();
} //End of FlappyBirdGame: --------------------------------------------------------------------------



// FlappyBird starts here:
void flappyBird() {
  image(FlappyBird, FlappyBirdX, FlappyBirdY);
  FlappyBirdY += VelocityOfFlappyBirdY;
  VelocityOfFlappyBirdY += g;

  //HitBox Display: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  noStroke();
  fill(255, 255, 255, 0);
  rect(FlappyBirdX, FlappyBirdY, FlappyBird.width, FlappyBird.height);

  collisionOfFlappyBirdAndGround();
} // Ends here: ---------------------------------------------------------------------------------------



// drawAndMovePipes starts here:
void drawAndMovePipes() {
  //The variables of the drawAndMovePipes:
  int i = 0;
  float s = 0.6;

  //PushMatrix: ======================================================================================
  pushMatrix();
  scale(s);


  while (i < n) {
    //Velocity of the pipelines:
    PositionXPipe[i] -= 5;
    float birdX = FlappyBirdX / s;

    //Detecting collision when the Flappy Bird passes through the pipes
    if (birdX > PositionXPipe[i] / s + TopPipe.width / 2 - 227 && !detectPassedPipes[i]) {
      points++;

      //ONLY TIME - PASSED THROUGH PIPES:
      detectPassedPipes[i] = true;
      scoring.play();
    }


    positionOfThePipe();

    //The floats of the pipe positions:
    float PositionOfPipeX = PositionXPipe[i] / s;
    float TopOfPipeY = topPipeY[i];
    float TopBottomGap = TopOfPipeY + TopPipe.height + gap;
    float bodyHeight = (height / s) - (TopBottomGap + TopOfPipe.height);

    //Images of the pipe
    image(TopPipe, PositionOfPipeX - 65, TopOfPipeY);
    image(TopOfPipe, PositionOfPipeX - 10, TopBottomGap);
    image(PipeBody, PositionOfPipeX, TopBottomGap + TopOfPipe.height, PipeBody.width, bodyHeight);

    //Hitboxes of the pipes:
    noStroke();
    fill(255, 0, 0, 0);

    // Top pipe + Bottom pipe hitboxes: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    rect(PositionOfPipeX, TopOfPipeY, TopPipe.width - 130, TopPipe.height - 7);
    rect(PositionOfPipeX - 15, TopBottomGap + TopOfPipe.height - 100, PipeBody.width + 35, bodyHeight + 150);


    //Detective collision between the Flappy Bird and the Pipes: ======================================
    // Flappy Bird size:
    //float birdX = fx / s;
    float birdY = FlappyBirdY / s;
    float birdW = FlappyBird.width;
    float birdH = FlappyBird.height;

    // Top pipe hitbox
    float topX = PositionOfPipeX;
    float topY = TopOfPipeY;
    float topW = TopPipe.width - 130;
    float topH = TopPipe.height - 7;

    if (birdX < topX + topW && birdX + birdW > topX && birdY < topY + topH && birdY + birdH > topY) {
      dying.play();
      mode = EndingScreen;
    }

    // Bottom pipe hitbox:
    float bottomX = PositionOfPipeX - 15;
    float bottomY = TopBottomGap + TopOfPipe.height - 100;
    float bottomW = PipeBody.width + 35;
    float bottomH = bodyHeight + 150;

    if (birdX < bottomX + bottomW && birdX + birdW > bottomX && birdY < bottomY + bottomH && birdY + birdH > bottomY) {
      dying.play();
      mode = EndingScreen;
    }

    // Gap Hitbox between the pipes:
    fill(0, 255, 0, 0);
    noStroke();

    // HitBox points
    float GapBetweenPipeX = PositionOfPipeX - 12;
    float GapBetweenPipeY = TopPipe.height + TopOfPipe.height + topPipeY[i] - 107;
    float GapBetweenPipeWidth = PipeBody.width + 35;
    float GapBetweenPipeHeight = gap;


    //Hitboxes of the gap: ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    rect(GapBetweenPipeX, GapBetweenPipeY, GapBetweenPipeWidth, GapBetweenPipeHeight);


    i++;
  }

  popMatrix();
  //PopMatrix ends here: ===============================================================================
} //End of drawAndMovePipes: ---------------------------------------------------------------------------



void positionOfThePipe() {
  float s = 0.6;
  int i = 0;

  returnCyclePipePosition();

  while (i < n) {
    if (PositionXPipe[i] < -TopPipe.width * s) {
      PositionXPipe[i] = returnPipePosition + 500;
      topPipeY[i] = int(random(-400, -100));

      //Cycles back the pipes while setting them to "false"
      detectPassedPipes[i] = false;
    }
    i++;
  }
} //End of the positionOfThePipe: -------------------------------------------------------------------------



void returnCyclePipePosition() {
  int i = 0;
  returnPipePosition = PositionXPipe[0];

  while (i < n) {
    if (PositionXPipe[i] > returnPipePosition) {
      returnPipePosition = PositionXPipe[i];
    }
    i++;
  }
} //End of the returnCyclePipePosition: --------------------------------------------------------------------



void resetGameFunction() {
  // Reset game
  mode = StartingScreen;
  FlappyBirdY = height / 2;
  VelocityOfFlappyBirdY = 0;
  points = 0;

  // Reset pipes
  int i = 0;
  while (i < n) {
    PositionXPipe[i] = width + i * spacingBetweenPipes;
    topPipeY[i] = int(random(-400, -100));
    
    //Setting the Pipes to "false" and given the assigned arrays of the pipes
    detectPassedPipes[i] = false;
    i++;
  }
}

