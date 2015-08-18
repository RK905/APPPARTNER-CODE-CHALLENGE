//
//  TableSectionTableViewCell.h
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatData.h"
@interface ChatCell : UITableViewCell
- (void)loadWithData:(ChatData *)chatData;
@property (weak, nonatomic) IBOutlet UITextView *msgLab;
@property (weak, nonatomic) IBOutlet UILabel *usernameLab;
@property (weak, nonatomic) IBOutlet UIImageView *profileImg;
@end
