//
//  Comments.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "Comments.h"

#import "InstagramComment.h"

@implementation Comments

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.count forKey:@"count"];
    [encoder encodeObject:self.data forKey:@"data"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.count = [decoder decodeObjectForKey:@"count"];
        self.data = [decoder decodeObjectForKey:@"data"];
    }
    return self;
}

+ (Comments *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    Comments *instance = [[Comments alloc] init];
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

    if ([key isEqualToString:@"data"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray array];
            for (id valueMember in value) {
                InstagramComment *populatedMember = [InstagramComment instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.data = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.count) {
        [dictionary setObject:self.count forKey:@"count"];
    }

    if (self.data) {
        [dictionary setObject:self.data forKey:@"data"];
    }

    return dictionary;

}

@end
