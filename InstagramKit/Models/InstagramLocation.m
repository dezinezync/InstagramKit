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

#import "InstagramLocation.h"
#import "InstagramModel.h"

@interface InstagramLocation ()

@property (nonatomic, assign, readwrite) CLLocationCoordinate2D coordinates;

@end

@implementation InstagramLocation

- (void)encodeWithCoder:(NSCoder *)encoder;
{
    [super encodeWithCoder:encoder];
    [encoder encodeObject:self.locationID forKey:@"locationID"];
    [encoder encodeObject:self.latitude forKey:@"latitude"];
    [encoder encodeObject:self.longitude forKey:@"longitude"];
    [encoder encodeObject:self.name forKey:@"name"];
}

- (id)initWithCoder:(NSCoder *)decoder;
{
    if ((self = [super initWithCoder:decoder])) {
        self.locationID = [decoder decodeObjectForKey:@"locationID"];
        self.latitude = [decoder decodeObjectForKey:@"latitude"];
        self.longitude = [decoder decodeObjectForKey:@"longitude"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

+ (InstagramLocation *)instanceFromDictionary:(NSDictionary *)aDictionary;
{
    
    InstagramLocation *instance = [[InstagramLocation alloc] init];
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
{
    
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"locationID"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}

- (NSDictionary *)dictionaryRepresentation;
{
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.locationID) {
        [dictionary setObject:self.locationID forKey:@"locationID"];
    }
    
    if (self.latitude) {
        [dictionary setObject:self.latitude forKey:@"latitude"];
    }
    
    if (self.longitude) {
        [dictionary setObject:self.longitude forKey:@"longitude"];
    }
    
    if (self.name) {
        [dictionary setObject:self.name forKey:@"name"];
    }
    
    return dictionary;
    
}

#pragma mark - Getter

- (CLLocationCoordinate2D)coordinates
{
    
    if(!CLLocationCoordinate2DIsValid(_coordinates)) {
        _coordinates = (CLLocationCoordinate2D){[self.latitude doubleValue], [self.longitude doubleValue]};
    }
    
    return _coordinates;
    
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    InstagramLocation *copy = [super copyWithZone:zone];
    copy->_coordinates = _coordinates;
    copy->_latitude = _latitude;
    copy->_longitude = _longitude;
    copy->_name = [_name copy];
    return copy;
}

@end
