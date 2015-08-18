//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 08/12/2015.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import "ChatCell.h"
#import <QuartzCore/QuartzCore.h>



@implementation ChatCell

- (void)awakeFromNib
{
    self.profileImg.layer.cornerRadius = self.profileImg.frame.size.height /2;
    self.profileImg.layer.masksToBounds = YES;
    self.profileImg.layer.borderWidth = 0;
    // Initialization code
   }

- (void)loadWithData:(ChatData *)chatData
{

}

@end
