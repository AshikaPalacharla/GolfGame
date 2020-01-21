//
//  ViewController.h
//  GolfGame
//
//  Created by Palacharla, Ashika on 1/16/20.
//  Copyright © 2020 Palacharla, Ashika. All rights reserved.
//

#import <UIKit/UIKit.h>

#define speedScale 0.20
#define speedDamping 0.90  // friction rate
#define stopSpeed 5.0
@interface GolfController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *hole;
@property (strong, nonatomic) IBOutlet UIImageView *ball;
@property (strong, nonatomic) IBOutlet UIImageView *wall;
@property (strong, nonatomic) IBOutlet UIImageView *topwall;
@property (strong, nonatomic) IBOutlet UIImageView *sidewall;
@property (strong, nonatomic) IBOutlet UIImageView *sidewall2;
@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (strong, nonatomic) NSTimer *gameTimer;
@end

