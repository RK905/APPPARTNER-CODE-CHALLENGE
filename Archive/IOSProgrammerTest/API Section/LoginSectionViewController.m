//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"
#import "AFNetworking.h"
#import "AFNetworkActivityLogger.h"
#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])
NSDictionary *loginDic;
NSNumber *test;


@interface LoginSectionViewController ()

@end

@implementation LoginSectionViewController

- (void)viewDidLoad
{
    
    UIFont * fontLogin =[UIFont fontWithName:@"Machinato" size:18];
    UIColor * loginColor = [UIColor colorWithRed:137/255.0f green:137/255.0f blue:137/255.0f alpha:1.0f];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    self.usernameBox.attributedPlaceholder =  [[NSAttributedString alloc] initWithString:@"   Username" attributes:@{
                                               NSFontAttributeName : fontLogin, NSForegroundColorAttributeName: loginColor}];
    self.passwordBox.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"   Password" attributes:@{
                                                                                                                 NSFontAttributeName : fontLogin, NSForegroundColorAttributeName: loginColor}];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) prefersStatusBarHidden
{
    return YES;
}
- (IBAction)backAction:(id)sender
{
    MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
    [self.navigationController pushViewController:mainMenuViewController animated:YES];
}


-(void) sendRequest{
    NSString *strUser = self.usernameBox.text;
    NSString *strPass = self.passwordBox.text;
    
    NSString *URLString = [NSString stringWithFormat:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php?username=%@&password=%@",strUser,strPass];
    NSURL *url = [NSURL URLWithString:URLString];
 
    TICK;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    operation.responseSerializer.acceptableContentTypes = [operation.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *MyresponseTime = [NSString stringWithFormat:@"%f",-[startTime timeIntervalSinceNow]];
        // 3
        loginDic = (NSDictionary *)responseObject;
        NSArray *codeR = [loginDic objectForKey:@"code"];
        NSString *strCode = [NSString stringWithFormat:@"%@",codeR];
      
        NSArray *messageR = [loginDic objectForKey:@"message"];
        NSString *strMSG = [NSString stringWithFormat:@"%@",messageR];
        
        NSString *alertStr = [NSString stringWithFormat:@"Parsed Message : \n Code : %@ \n Message : %@ \n ResponseTime : %@ s",strCode,strMSG,MyresponseTime];
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login Successful"
                                                            message:alertStr
                                                           delegate:self
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];

        
        
        

        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        // 4
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Data"
                                                            message:[error localizedDescription]
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
 
    [operation start];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == [alertView cancelButtonIndex]) {
        MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
        [self.navigationController pushViewController:mainMenuViewController animated:YES];

    }
}


-(void) checkLogin{
    
    if ([self.usernameBox.text  isEqual:@"SuperBoise"] && [self.passwordBox.text  isEqual: @"qwerty"]){
         [self sendRequest];
         [self loginAlert];
    }
    else{
        UIAlertView *alertViewE = [[UIAlertView alloc] initWithTitle:@"Check Username/Password"
                                                            message:@"unable to login"
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertViewE show];

    }
}

-(void) loginAlert{
    
}
- (IBAction)pressLogin {
    
    [self checkLogin];
}
@end
