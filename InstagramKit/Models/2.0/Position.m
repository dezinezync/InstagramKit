//
//  Position.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "Position.h"

@implementation Position

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.x forKey:@"x"];
    [encoder encodeObject:self.y forKey:@"y"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.x = [decoder decodeObjectForKey:@"x"];
        self.y = [decoder decodeObjectForKey:@"y"];
    }
    return self;
}

+ (Position *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    Position *instance = [[Position alloc] init];
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

- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.x) {
        [dictionary setObject:self.x forKey:@"x"];
    }

    if (self.y) {
        [dictionary setObject:self.y forKey:@"y"];
    }

    return dictionary;

}

@end
