//
//  InstagramComment.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@class InstagramUser;

@interface InstagramComment : InstagramModel <NSCoding>

@property (nonatomic, copy) NSString *createdTime;
@property (nonatomic, copy) NSString *commentID;
@property (nonatomic, strong) InstagramUser *from;
@property (nonatomic, copy) NSString *text;


+ (InstagramComment *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
