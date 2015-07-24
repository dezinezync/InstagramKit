//
//  UsersInPhoto.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "UsersInPhoto.h"

#import "Position.h"
#import "InstagramUser.h"

@implementation UsersInPhoto

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.position forKey:@"position"];
    [encoder encodeObject:self.user forKey:@"user"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.position = [decoder decodeObjectForKey:@"position"];
        self.user = [decoder decodeObjectForKey:@"user"];
    }
    return self;
}

+ (UsersInPhoto *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    UsersInPhoto *instance = [[UsersInPhoto alloc] init];
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

    if ([key isEqualToString:@"position"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.position = [Position instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"user"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.user = [InstagramUser instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.position) {
        [dictionary setObject:self.position forKey:@"position"];
    }

    if (self.user) {
        [dictionary setObject:self.user forKey:@"user"];
    }

    return dictionary;

}

@end
