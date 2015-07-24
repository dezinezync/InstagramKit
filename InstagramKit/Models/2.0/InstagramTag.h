//
//  InstagramTag.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"


@interface InstagramTag : InstagramModel <NSCoding>

@property (nonatomic, copy) NSNumber *mediaCount;
@property (nonatomic, copy) NSString *name;


+ (InstagramTag *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
