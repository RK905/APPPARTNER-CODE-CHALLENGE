//
//  ChatData.h
//  IOSProgrammerTest
//
//  Created by Rayen Kamta on 12/19/14.
//  Copyright (c) 2015 Rayen Kamta. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatData : NSObject
@property (nonatomic, readwrite) int user_id;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *avatar_url;
@property (nonatomic, strong) NSString *message;
- (void)loadWithDictionary:(NSDictionary *)dict;
@end
