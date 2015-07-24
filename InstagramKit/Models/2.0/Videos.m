//
//  Videos.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "Videos.h"

#import "LowRes.h"
#import "StandardRes.h"

@implementation Videos

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.lowResolution forKey:@"lowResolution"];
    [encoder encodeObject:self.standardResolution forKey:@"standardResolution"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.lowResolution = [decoder decodeObjectForKey:@"lowResolution"];
        self.standardResolution = [decoder decodeObjectForKey:@"standardResolution"];
    }
    return self;
}

+ (Videos *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    Videos *instance = [[Videos alloc] init];
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

- (void)setValue:(id)value forKey:(NSString *)key;
{

    if ([key isEqualToString:@"low_resolution"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.lowResolution = [LowRes instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"standard_resolution"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.standardResolution = [StandardRes instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
{

    if ([key isEqualToString:@"low_resolution"]) {
        [self setValue:value forKey:@"lowResolution"];
    } else if ([key isEqualToString:@"standard_resolution"]) {
        [self setValue:value forKey:@"standardResolution"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.lowResolution) {
        [dictionary setObject:self.lowResolution forKey:@"lowResolution"];
    }

    if (self.standardResolution) {
        [dictionary setObject:self.standardResolution forKey:@"standardResolution"];
    }

    return dictionary;

}

@end
