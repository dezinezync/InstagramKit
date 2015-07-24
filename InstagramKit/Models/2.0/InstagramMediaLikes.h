//
//  InstagramMediaLikes.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@interface InstagramMediaLikes : InstagramModel <NSCoding>

@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, copy) NSArray *data;


+ (InstagramMediaLikes *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
