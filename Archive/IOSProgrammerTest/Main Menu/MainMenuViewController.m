//
//  ViewController.m
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import "MainMenuViewController.h"
#import "ChatSectionViewController.h"
#import "LoginSectionViewController.h"
#import "AnimationSectionViewController.h"

@interface MainMenuViewController ()

@end

@implementation MainMenuViewController

- (void)viewDidLoad
{
    
   


    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName: [UIFont fontWithName:@"Machinato-Light" size:20],NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.chatLabel.font = [UIFont fontWithName:@"Machinato" size:22];
    self.animationLabel.font = [UIFont fontWithName:@"Machinato" size:22];
    self.loginLabel.font = [UIFont fontWithName:@"Machinato" size:22];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)tableSectionAction:(id)sender
{
    ChatSectionViewController *tableSectionViewController = [[ChatSectionViewController alloc] init];
    [self.navigationController pushViewController:tableSectionViewController animated:YES];
}
- (IBAction)apiSectionAction:(id)sender
{
    LoginSectionViewController *apiSectionViewController = [[LoginSectionViewController alloc] init];
    [self.navigationController pushViewController:apiSectionViewController animated:YES];
}
- (IBAction)animationSectionAction:(id)sender
{
    AnimationSectionViewController *animationSectionViewController = [[AnimationSectionViewController alloc] init];
    [self.navigationController pushViewController:animationSectionViewController animated:YES];
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}
@end
