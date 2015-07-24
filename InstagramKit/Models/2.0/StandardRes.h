//
//  StandardRes.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@interface StandardRes : InstagramModel <NSCoding>

@property (nonatomic, copy) NSNumber *height;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSNumber *width;


+ (StandardRes *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end