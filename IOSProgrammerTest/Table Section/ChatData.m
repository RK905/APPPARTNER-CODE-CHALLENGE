//
//  ChatData.m
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 12/19/14.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import "ChatData.h"

@implementation ChatData
- (void)loadWithDictionary:(NSDictionary *)dict
{
    self.user_id = [[dict objectForKey:@"user_id"] intValue];
    self.username = [dict objectForKey:@"username"];
    self.avatar_url = [dict objectForKey:@"avatar_url"];
    self.message = [dict objectForKey:@"message"];
}
@end
