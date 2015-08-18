//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface AnimationSectionViewController ()

@end

@implementation AnimationSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.spinLabl.font = [UIFont fontWithName:@"Machinato" size:22];


}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint location = [touch locationInView:touch.view];
    self.imageLogo.center = location;
    
   
}

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesBegan:touches withEvent:event];
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (void) runSpinAnimationOnView:(UIImageView*)view duration:(CGFloat)duration rotations:(CGFloat)rotations repeat:(float)repeat;
{
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 /* full rotation*/ * rotations * duration ];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    [self.imageLogo.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (IBAction)SpinButn {
    
    [self runSpinAnimationOnView:self.imageLogo duration:2.0 rotations:5.0 repeat:1.0];

    

}
    @end
