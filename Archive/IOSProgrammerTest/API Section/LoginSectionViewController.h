//
//  APISectionViewController.h
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginSectionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameBox;
@property (weak, nonatomic) IBOutlet UITextField *passwordBox;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

- (IBAction)pressLogin;
@end
