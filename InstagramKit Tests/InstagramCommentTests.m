//
//  InstagramCommentTests.m
//  InstagramKit
//
//  Created by Nikhil Nigade on 7/24/15.
//  Copyright (c) 2015 InstagramKit. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "InstagramComment.h"

@interface InstagramCommentTests : XCTestCase {
    NSDictionary *_referenceDict;
}

@end

@implementation InstagramCommentTests

- (void)setUp
{
    [super setUp];
    
    _referenceDict = @{
                       @"created_time": @"1280780324",
                       @"text": @"Really amazing photo!",
                       @"from": @{
                               @"username": @"snoopdogg",
                               @"profile_picture": @"http://images.instagram.com/profiles/profile_16_75sq_1305612434.jpg",
                               @"id": @"1574083",
                               @"full_name": @"Snoop Dogg"
                               },
                       @"id": @"420"
                       };
}

- (void)testCreatingFromDictionary
{
    
    InstagramComment *instance = [InstagramComment instanceFromDictionary:_referenceDict];
    
    XCTAssert(instance, @"A valid instance did not get created.");
    
}

- (void)testDictionaryRepresentation
{
    
    InstagramComment *instance = [InstagramComment instanceFromDictionary:_referenceDict];
    
    NSDictionary *instanceRepresentation = [instance dictionaryRepresentation];
    
    XCTAssert(instanceRepresentation.count == 4 &&
              ((NSDictionary *)[instanceRepresentation objectForKey:@"user"]).count == 4,
              @"A valid instance representation did not get created.");
    
}

@end
