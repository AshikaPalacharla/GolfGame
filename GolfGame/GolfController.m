//
//  ViewController.m
//  GolfGame
//
//  Created by Palacharla, Ashika on 1/16/20.
//  Copyright © 2020 Palacharla, Ashika. All rights reserved.
//

#import "GolfController.h"

@implementation GolfController

@synthesize ball, hole, wall1, wall2, wall3, sidewall1, sidewall2, topwall, bottomwall, portal, portal2;

- (void)viewDidLoad {
  [super viewDidLoad];
  // changes hole image to be circular
  self.hole.layer.cornerRadius = .5*self.hole.layer.frame.size.height;
  self.hole.layer.masksToBounds = YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Began");
  UITouch *touch = [touches anyObject];
  // turn user interaction off as swipe begins
  [self.view setUserInteractionEnabled:NO];
   
  // store point a touch began
  self.firstPoint = [touch locationInView:self.view];
   
}

/**
* Automatic action that occus when user releases at end of swipe
*/
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  NSLog(@"touches Ended");
   
  UITouch *touch = [touches anyObject];
   
  // store point a touch end
  self.lastPoint = [touch locationInView:self.view];
   
  // logic to calculate swipevector as distance between touch began and touch end
  CGPoint swipeVector = CGPointMake(self.lastPoint.x - self.firstPoint.x, self.lastPoint.y - self.firstPoint.y);
   
  // velocity of ball based off of swipe
  self.ballVelocityX = speedScale * swipeVector.x;
  self.ballVelocityY = speedScale * swipeVector.y;
   
  // move ball occurs multiple times at this sampling rate, until friction causes ball to stop
  self.gameTimer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(moveBall) userInfo:nil repeats:YES];
}

/**
* Changes center of ball, which is connected to outlet, this is called recursively by timer
*/
-(void)moveBall {
  // simulates friction by reducing velocity
  self.ballVelocityX = speedDamping * self.ballVelocityX;
  self.ballVelocityY = speedDamping * self.ballVelocityY;
   
  // this is the ball move
  self.ball.center = CGPointMake(self.ball.center.x + self.ballVelocityX, self.ball.center.y + self.ballVelocityY);
   
  // logic to calculate if ball and hole collide
  if (CGRectIntersectsRect(self.ball.frame, self.hole.frame)) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
    self.ball.center = CGPointMake(self.hole.center.x, self.hole.center.y);
    self.ball.alpha = 0.2;
  }
   
    if(CGRectIntersectsRect(self.ball.frame, self.wall1.frame)) {
     // simulates friction by reducing velocity
        self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
        self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
    }
    if(CGRectIntersectsRect(self.ball.frame, self.wall2.frame)) {
    // simulates friction by reducing velocity
       self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
       self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
     }
    if(CGRectIntersectsRect(self.ball.frame, self.wall3.frame)) {
    // simulates friction by reducing velocity
       self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
       self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
     }
    if(CGRectIntersectsRect(self.ball.frame, self.topwall.frame)) {
     // simulates friction by reducing velocity
        self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
        self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
      }
    if(CGRectIntersectsRect(self.ball.frame, self.bottomwall.frame)) {
     // simulates friction by reducing velocity
        self.ballVelocityX = (1) * speedDamping * self.ballVelocityX;
        self.ballVelocityY = (-1) * speedDamping * self.ballVelocityY;
      }
     if(CGRectIntersectsRect(self.ball.frame, self.sidewall1.frame)) {
     // simulates friction by reducing velocity
        self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
        self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
      }
    if(CGRectIntersectsRect(self.ball.frame, self.sidewall2.frame)) {
    // simulates friction by reducing velocity
       self.ballVelocityX = (-1) * speedDamping * self.ballVelocityX;
       self.ballVelocityY = (1) * speedDamping * self.ballVelocityY;
     }
    if (CGRectIntersectsRect(self.ball.frame, self.portal.frame)) {
       self.ball.center = CGPointMake(self.portal2.center.x, self.portal2.center.y);
    }
     // if ball slows/stops turn off game timer and turn user interaction back on
    if(fabs(self.ballVelocityX) < stopSpeed && fabs(self.ballVelocityY) < stopSpeed) {
    [self.gameTimer invalidate];
    [self.view setUserInteractionEnabled:YES];
      
    }
   }
@end
