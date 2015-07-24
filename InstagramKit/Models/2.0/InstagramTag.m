//
//  InstagramTag.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramTag.h"

@implementation InstagramTag

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.mediaCount forKey:@"mediaCount"];
    [encoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.mediaCount = [decoder decodeObjectForKey:@"mediaCount"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

+ (InstagramTag *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    InstagramTag *instance = [[InstagramTag alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
{

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
{

    if ([key isEqualToString:@"media_count"]) {
        [self setValue:value forKey:@"mediaCount"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.mediaCount) {
        [dictionary setObject:self.mediaCount forKey:@"mediaCount"];
    }

    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }

    return dictionary;

}

@end
