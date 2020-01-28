//
//  ViewController.h
//  GolfGame
//
//  Created by Palacharla, Ashika on 1/16/20.
//  Copyright © 2020 Palacharla, Ashika. All rights reserved.
//

#import <UIKit/UIKit.h>

#define speedScale 0.20
#define speedDamping 0.9 // friction rate
#define stopSpeed 5.0
#define sandTrap 0.5

@interface GolfController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *hole;
@property (strong, nonatomic) IBOutlet UIImageView *ball;

@property (strong, nonatomic) IBOutlet UIImageView *wall1;
@property (strong, nonatomic) IBOutlet UIImageView *wall2;
@property (strong, nonatomic) IBOutlet UIImageView *wall3;
@property (strong, nonatomic) IBOutlet UIImageView *topwall;
@property (strong, nonatomic) IBOutlet UIImageView *bottomwall;
@property (strong, nonatomic) IBOutlet UIImageView *sidewall1;
@property (strong, nonatomic) IBOutlet UIImageView *sidewall2;

@property (strong, nonatomic) IBOutlet UIImageView *portal;
@property (strong, nonatomic) IBOutlet UIImageView *portal2;

@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint lastPoint;
@property (nonatomic) float ballVelocityX;
@property (nonatomic) float ballVelocityY;
@property (strong, nonatomic) NSTimer *gameTimer;

@end
