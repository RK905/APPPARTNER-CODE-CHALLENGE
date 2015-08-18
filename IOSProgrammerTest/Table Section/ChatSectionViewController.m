//
//  TableSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>

#import "ChatSectionViewController.h"
#import "MainMenuViewController.h"
#import "ChatCell.h"


#define TABLE_CELL_HEIGHT 100.0f
#import <QuartzCore/QuartzCore.h>

@interface ChatSectionViewController ()
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *loadedChatData;
@end

@implementation ChatSectionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    UINib *nib = [UINib nibWithNibName:@"ChatCell" bundle:nil];
    [[self tableView] registerNib:nib forCellReuseIdentifier:@"ChatCell"];
    
    self.loadedChatData = [[NSMutableArray alloc] init];
    [self loadJSONData];
    
}


- (BOOL) prefersStatusBarHidden
{
    return YES;
}

- (void)loadJSONData
{

    dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
    dispatch_async(myQueue, ^{
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"chatData" ofType:@"json"];
        
        NSError *error = nil;
        
        NSData *rawData = [NSData dataWithContentsOfFile:filePath options:NSDataReadingMappedIfSafe error:&error];
        
        id JSONData = [NSJSONSerialization JSONObjectWithData:rawData options:NSJSONReadingAllowFragments error:&error];
        
        [self.loadedChatData removeAllObjects];
        if ([JSONData isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *jsonDict = (NSDictionary *)JSONData;
            
            NSArray *loadedArray = [jsonDict objectForKey:@"data"];
            if ([loadedArray isKindOfClass:[NSArray class]])
            {
                for (NSDictionary *chatDict in loadedArray)
                {
                    ChatData *chatData = [[ChatData alloc] init];
                    [chatData loadWithDictionary:chatDict];
                    [self.loadedChatData addObject:chatData];
                }
            }
        }
        
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            [self.tableView reloadData];
            
        });
    });

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

#pragma mark - UITableViewDataSource



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Create an instance of ItemCell
    ChatCell *cell =  [tableView dequeueReusableCellWithIdentifier:@"ChatCell"];
    ChatData *chatData = [self.loadedChatData objectAtIndex:[indexPath row]];
    UIFont * fontMach =[UIFont fontWithName:@"Machinato" size:18];
    UIFont * fontMachm =[UIFont fontWithName:@"Machinato" size:15];
    cell.usernameLab.text=chatData.username;
    cell.msgLab.text=chatData.message;
    cell.msgLab.font = fontMachm;
    cell.usernameLab.font = fontMach;
   
    
    NSURL *imageURL = [NSURL URLWithString:chatData.avatar_url];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            cell.profileImg.image = [UIImage imageWithData:imageData];
    
            
        });
        
       
    });

   
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.loadedChatData.count;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TABLE_CELL_HEIGHT;
}
@end
