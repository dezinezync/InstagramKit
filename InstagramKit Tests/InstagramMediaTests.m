//
//  InstagramMediaTests.m
//  InstagramKit
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 InstagramKit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "InstagramMedia.h"

@interface InstagramMediaTests : XCTestCase {
    NSDictionary *_referenceDict;
}

@end

@implementation InstagramMediaTests

- (void)setUp {
    [super setUp];
    
    _referenceDict = @{
        @"type": @"image",
        @"users_in_photo": @[
                           @{
                               @"user": @{
                                   @"username": @"kevin",
                                   @"full_name": @"Kevin S",
                                   @"id": @"3",
                                   @"profile_picture": @"..."
                               },
                               @"position": @{
                                   @"x": @(0.315),
                                   @"y": @(0.9111)
                               }
                           }
                           ],
        @"filter": @"Walden",
        @"tags": @[],
        @"comments": @{
            @"data": @[
                     @{
                         @"created_time": @"1279332030",
                         @"text": @"Love the sign here",
                         @"from": @{
                             @"username": @"mikeyk",
                             @"full_name": @"Mikey Krieger",
                             @"id": @"4",
                             @"profile_picture": @"http://distillery.s3.amazonaws.com/profiles/profile_1242695_75sq_1293915800.jpg"
                         },
                         @"id": @"8"
                     },
                     @{
                         @"created_time": @"1279341004",
                         @"text": @"Chilako taco",
                         @"from": @{
                             @"username": @"kevin",
                             @"full_name": @"Kevin S",
                             @"id": @"3",
                             @"profile_picture": @"..."
                         },
                         @"id": @"3"
                     }
                     ],
            @"count": @2
        },
        @"caption": [NSNull null],
        @"likes": @{
            @"count": @1,
            @"data": @[
                     @{
                         @"username": @"mikeyk",
                         @"full_name": @"Mikeyk",
                         @"id": @"4",
                         @"profile_picture": @"..."
                     }
                     ]
        },
        @"link": @"http://instagr.am/p/D/",
        @"user": @{
            @"username": @"kevin",
            @"full_name": @"Kevin S",
            @"profile_picture": @"...",
            @"id": @"3"
        },
        @"created_time": @"1279340983",
        @"images": @{
            @"low_resolution": @{
                @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_6.jpg",
                @"width": @306,
                @"height": @306
            },
            @"thumbnail": @{
                @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_5.jpg",
                @"width": @150,
                @"height": @150
            },
            @"standard_resolution": @{
                @"url": @"http://distillery.s3.amazonaws.com/media/2010/07/16/4de37e03aa4b4372843a7eb33fa41cad_7.jpg",
                @"width": @612,
                @"height": @612
            }
        },
        @"id": @"3",
        @"location": @{
            @"id": @"1",
            @"latitude": @(37.782),
            @"name": @"Dogpatch Labs",
            @"longitude": @(-122.387)
        },
        @"videos": @{
            @"low_resolution": @{
                @"url": @"http://distilleryvesper9-13.ak.instagram.com/090d06dad9cd11e2aa0912313817975d_102.mp4",
                @"width": @480,
                @"height": @480
            },
            @"standard_resolution": @{
                @"url": @"http://distilleryvesper9-13.ak.instagram.com/090d06dad9cd11e2aa0912313817975d_101.mp4",
                @"width": @640,
                @"height": @640
            }
        }
        };
    
}

- (void)testCreatingFromDictionary
{
    
    InstagramMedia *instance = [InstagramMedia instanceFromDictionary:_referenceDict];
    
    XCTAssert(instance, @"A valid instance did not get created.");
    XCTAssert(!instance.caption, @"The instance created did not handle a NSNull properly for the caption.");
    
}

@end
