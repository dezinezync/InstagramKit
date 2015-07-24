//
//  Position.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@interface Position : InstagramModel <NSCoding>

@property (nonatomic, copy) NSNumber *x;
@property (nonatomic, copy) NSNumber *y;


+ (Position *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
