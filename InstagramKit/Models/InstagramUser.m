//
//    Copyright (c) 2015 Shyam Bhat
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy of
//    this software and associated documentation files (the "Software"), to deal in
//    the Software without restriction, including without limitation the rights to
//    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//    the Software, and to permit persons to whom the Software is furnished to do so,
//    subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//    FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//    COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//    IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//    CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "InstagramUser.h"
#import "InstagramEngine.h"

@implementation InstagramUser

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.bio forKey:@"bio"];
    [encoder encodeObject:self.counts forKey:@"counts"];
    [encoder encodeObject:self.followedBy forKey:@"followedBy"];
    [encoder encodeObject:self.follows forKey:@"follows"];
    [encoder encodeObject:self.fullName forKey:@"fullName"];
    [encoder encodeObject:self.instagramUserID forKey:@"instagramUserID"];
    [encoder encodeObject:self.media forKey:@"media"];
    [encoder encodeObject:self.profilePicture forKey:@"profilePicture"];
    [encoder encodeObject:self.username forKey:@"username"];
    [encoder encodeObject:self.website forKey:@"website"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.bio = [decoder decodeObjectForKey:@"bio"];
        self.counts = [decoder decodeObjectForKey:@"counts"];
        self.followedBy = [decoder decodeObjectForKey:@"followedBy"];
        self.follows = [decoder decodeObjectForKey:@"follows"];
        self.fullName = [decoder decodeObjectForKey:@"fullName"];
        self.instagramUserID = [decoder decodeObjectForKey:@"instagramUserID"];
        self.media = [decoder decodeObjectForKey:@"media"];
        self.profilePicture = [decoder decodeObjectForKey:@"profilePicture"];
        self.username = [decoder decodeObjectForKey:@"username"];
        self.website = [decoder decodeObjectForKey:@"website"];
    }
    return self;
}

+ (InstagramUser *)instanceFromDictionary:(NSDictionary *)aDictionary;
{
    
    InstagramUser *instance = [[InstagramUser alloc] init];
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
    
    if ([key isEqualToString:@"counts"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            
            self.followedBy = [value objectForKey:@"followed_by"];
            self.follows    = [value objectForKey:@"follows"];
            self.media      = [value objectForKey:@"media"];
            
        }
        
    } else {
        [super setValue:value forKey:key];
    }
    
}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
{
    
    if ([key isEqualToString:@"followed_by"]) {
        [self setValue:value forKey:@"followedBy"];
    } else if ([key isEqualToString:@"full_name"]) {
        [self setValue:value forKey:@"fullName"];
    } else if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"instagramUserID"];
    } else if ([key isEqualToString:@"profile_picture"]) {
        [self setValue:value forKey:@"profilePicture"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}

- (void)updateDetails:(NSDictionary *)aDict
{
    
    [self setAttributesFromDictionary:aDict];
    
}

- (NSDictionary *)dictionaryRepresentation;
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.bio) {
        [dictionary setObject:self.bio forKey:@"bio"];
    }
    
    if (self.counts) {
        [dictionary setObject:self.counts forKey:@"counts"];
    }
    
    if (self.followedBy) {
        [dictionary setObject:self.followedBy forKey:@"followedBy"];
    }
    
    if (self.follows) {
        [dictionary setObject:self.follows forKey:@"follows"];
    }
    
    if (self.fullName) {
        [dictionary setObject:self.fullName forKey:@"fullName"];
    }
    
    if (self.instagramUserID) {
        [dictionary setObject:self.instagramUserID forKey:@"instagramUserID"];
    }
    
    if (self.media) {
        [dictionary setObject:self.media forKey:@"media"];
    }
    
    if (self.profilePicture) {
        [dictionary setObject:self.profilePicture forKey:@"profilePicture"];
    }
    
    if (self.username) {
        [dictionary setObject:self.username forKey:@"username"];
    }
    
    if (self.website) {
        [dictionary setObject:self.website forKey:@"website"];
    }
    
    return dictionary;
    
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    InstagramUser *copy = [super copyWithZone:zone];
    copy->_username = [_username copy];
    copy->_fullName = [_fullName copy];
    copy->_profilePicture = [_profilePicture copy];
    copy->_bio = [_bio copy];
    copy->_website = [_website copy];
    return copy;
}

@end
