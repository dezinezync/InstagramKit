//
//  InstagramMedia.m
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramMedia.h"

@implementation InstagramMedia

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.caption forKey:@"caption"];
    [encoder encodeObject:self.comments forKey:@"comments"];
    [encoder encodeObject:self.createdTime forKey:@"createdTime"];
    [encoder encodeObject:self.filter forKey:@"filter"];
    [encoder encodeObject:self.instagramMediaID forKey:@"instagramMediaID"];
    [encoder encodeObject:self.images forKey:@"images"];
    [encoder encodeObject:self.likes forKey:@"likes"];
    [encoder encodeObject:self.link forKey:@"link"];
    [encoder encodeObject:self.location forKey:@"location"];
    [encoder encodeObject:self.tags forKey:@"tags"];
    [encoder encodeObject:self.type forKey:@"type"];
    [encoder encodeObject:self.user forKey:@"user"];
    [encoder encodeObject:self.usersInPhoto forKey:@"usersInPhoto"];
    [encoder encodeObject:self.videos forKey:@"videos"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.caption = [decoder decodeObjectForKey:@"caption"];
        self.comments = [decoder decodeObjectForKey:@"comments"];
        self.createdTime = [decoder decodeObjectForKey:@"createdTime"];
        self.filter = [decoder decodeObjectForKey:@"filter"];
        self.instagramMediaID = [decoder decodeObjectForKey:@"instagramMediaID"];
        self.images = [decoder decodeObjectForKey:@"images"];
        self.likes = [decoder decodeObjectForKey:@"likes"];
        self.link = [decoder decodeObjectForKey:@"link"];
        self.location = [decoder decodeObjectForKey:@"location"];
        self.tags = [decoder decodeObjectForKey:@"tags"];
        self.type = [decoder decodeObjectForKey:@"type"];
        self.user = [decoder decodeObjectForKey:@"user"];
        self.usersInPhoto = [decoder decodeObjectForKey:@"usersInPhoto"];
        self.videos = [decoder decodeObjectForKey:@"videos"];
    }
    return self;
}

+ (InstagramMedia *)instanceFromDictionary:(NSDictionary *)aDictionary;
{

    InstagramMedia *instance = [[InstagramMedia alloc] init];
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

    if ([key isEqualToString:@"comments"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.comments = [Comments instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"images"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.images = [Images instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"likes"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.likes = [InstagramMediaLikes instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"location"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.location = [InstagramLocation instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"tags"]) {

        if ([value isKindOfClass:[NSArray class]])
        {

            NSMutableArray *myMembers = [NSMutableArray array];
            for (id valueMember in value) {
                [myMembers addObject:[InstagramTag instanceFromDictionary:valueMember]];
            }

            self.tags = myMembers;

        }

    } else if ([key isEqualToString:@"user"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.user = [InstagramUser instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"users_in_photo"]) {

        if ([value isKindOfClass:[NSArray class]])
{

            NSMutableArray *myMembers = [NSMutableArray array];
            for (id valueMember in value) {
                UsersInPhoto *populatedMember = [UsersInPhoto instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.usersInPhoto = myMembers;

        }

    } else if ([key isEqualToString:@"videos"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.videos = [Videos instanceFromDictionary:value];
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
        [self setValue:value forKey:@"instagramMediaID"];
    } else if ([key isEqualToString:@"users_in_photo"]) {
        [self setValue:value forKey:@"usersInPhoto"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation;
{

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.caption) {
        [dictionary setObject:self.caption forKey:@"caption"];
    }

    if (self.comments) {
        [dictionary setObject:self.comments forKey:@"comments"];
    }

    if (self.createdTime) {
        [dictionary setObject:self.createdTime forKey:@"createdTime"];
    }

    if (self.filter) {
        [dictionary setObject:self.filter forKey:@"filter"];
    }

    if (self.instagramMediaID) {
        [dictionary setObject:self.instagramMediaID forKey:@"instagramMediaID"];
    }

    if (self.images) {
        [dictionary setObject:self.images forKey:@"images"];
    }

    if (self.likes) {
        [dictionary setObject:self.likes forKey:@"likes"];
    }

    if (self.link) {
        [dictionary setObject:self.link forKey:@"link"];
    }

    if (self.location) {
        [dictionary setObject:self.location forKey:@"location"];
    }

    if (self.tags) {
        [dictionary setObject:self.tags forKey:@"tags"];
    }

    if (self.type) {
        [dictionary setObject:self.type forKey:@"type"];
    }

    if (self.user) {
        [dictionary setObject:self.user forKey:@"user"];
    }

    if (self.usersInPhoto) {
        [dictionary setObject:self.usersInPhoto forKey:@"usersInPhoto"];
    }

    if (self.videos) {
        [dictionary setObject:self.videos forKey:@"videos"];
    }

    return dictionary;

}

@end
