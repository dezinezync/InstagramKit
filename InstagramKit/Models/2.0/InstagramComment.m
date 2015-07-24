//
//  InstagramComment.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramComment.h"

#import "InstagramUser.h"

@implementation InstagramComment

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.createdTime forKey:@"createdTime"];
    [encoder encodeObject:self.commentID forKey:@"commentID"];
    [encoder encodeObject:self.from forKey:@"from"];
    [encoder encodeObject:self.text forKey:@"text"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.createdTime = [decoder decodeObjectForKey:@"createdTime"];
        self.commentID = [decoder decodeObjectForKey:@"commentID"];
        self.from = [decoder decodeObjectForKey:@"from"];
        self.text = [decoder decodeObjectForKey:@"text"];
    }
    return self;
}

+ (InstagramComment *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    InstagramComment *instance = [[InstagramComment alloc] init];
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

    if ([key isEqualToString:@"from"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.from = [InstagramUser instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
{

    if ([key isEqualToString:@"created_time"]) {
        [self setValue:value forKey:@"createdTime"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"commentID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.createdTime) {
        [dictionary setObject:self.createdTime forKey:@"createdTime"];
    }

    if (self.commentID) {
        [dictionary setObject:self.commentID forKey:@"commentID"];
    }

    if (self.from) {
        [dictionary setObject:self.from forKey:@"from"];
    }

    if (self.text) {
        [dictionary setObject:self.text forKey:@"text"];
    }

    return dictionary;

}

@end
