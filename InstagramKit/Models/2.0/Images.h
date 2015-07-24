//
//  Images.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@class LowRes;
@class StandardRes;
@class Thumbnail;

@interface Images : InstagramModel <NSCoding>

@property (nonatomic, strong) LowRes *lowResolution;
@property (nonatomic, strong) StandardRes *standardResolution;
@property (nonatomic, strong) Thumbnail *thumbnail;


+ (Images *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
