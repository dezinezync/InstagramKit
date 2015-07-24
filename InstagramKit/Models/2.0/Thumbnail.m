//
//  Thumbnail.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "Thumbnail.h"

@implementation Thumbnail

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.height forKey:@"height"];
    [encoder encodeObject:self.url forKey:@"url"];
    [encoder encodeObject:self.width forKey:@"width"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.height = [decoder decodeObjectForKey:@"height"];
        self.url = [decoder decodeObjectForKey:@"url"];
        self.width = [decoder decodeObjectForKey:@"width"];
    }
    return self;
}

+ (Thumbnail *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    Thumbnail *instance = [[Thumbnail alloc] init];
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

    if (self.height) {
        [dictionary setObject:self.height forKey:@"height"];
    }

    if (self.url) {
        [dictionary setObject:self.url forKey:@"url"];
    }

    if (self.width) {
        [dictionary setObject:self.width forKey:@"width"];
    }

    return dictionary;

}

@end
