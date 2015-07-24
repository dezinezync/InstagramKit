//
//  InstagramMedia.h
//  
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 Dezine Zync Studios LLP.. All rights reserved.
//

#import "InstagramModel.h"
#import "Comments.h"
#import "InstagramComment.h"
#import "Images.h"
#import "InstagramMediaLikes.h"
#import "InstagramLocation.h"
#import "InstagramUser.h"
#import "Videos.h"
#import "UsersInPhoto.h"
#import "InstagramTag.h"

@interface InstagramMedia : InstagramModel <NSCoding>

@property (nonatomic, copy) NSString *caption;
@property (nonatomic, strong) Comments *comments;
@property (nonatomic, copy) NSString *createdTime;
@property (nonatomic, copy) NSString *filter;
@property (nonatomic, copy) NSString *instagramMediaID;
@property (nonatomic, strong) Images *images;
@property (nonatomic, strong) InstagramMediaLikes *likes;
@property (nonatomic, copy) NSString *link;
@property (nonatomic, strong) InstagramLocation *location;
@property (nonatomic, copy) NSArray *tags;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) InstagramUser *user;
@property (nonatomic, copy) NSArray *usersInPhoto;
@property (nonatomic, strong) Videos *videos;


+ (InstagramMedia *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
