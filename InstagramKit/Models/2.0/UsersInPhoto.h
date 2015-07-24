//
//  UsersInPhoto.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@class Position;
@class InstagramUser;

@interface UsersInPhoto : InstagramModel <NSCoding>

@property (nonatomic, strong) Position *position;
@property (nonatomic, strong) InstagramUser *user;


+ (UsersInPhoto *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
