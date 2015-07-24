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

#import "InstagramModel.h"

@interface InstagramUser : InstagramModel <NSSecureCoding, NSCopying>

@property (nonatomic, copy) NSString *bio;
@property (nonatomic, strong) InstagramUser *counts;
@property (nonatomic, copy) NSNumber *followedBy;
@property (nonatomic, copy) NSNumber *follows;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) NSString *instagramUserID;
@property (nonatomic, copy) NSNumber *media;
@property (nonatomic, copy) NSString *profilePicture;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *website;


+ (InstagramUser *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

- (void)updateDetails:(NSDictionary *)aDict;

@end