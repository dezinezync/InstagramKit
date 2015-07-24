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

#import "InstagramComment.h"
#import "InstagramUser.h"

@implementation InstagramComment

- (instancetype)initWithInfo:(NSDictionary *)info
{
    
    if (self = [super initWithInfo:info]) {
        
        [self setAttributesFromDictionary:info];
        
//        _user = [[InstagramUser alloc] initWithInfo:info[kCreator]];
//        _text = [[NSString alloc] initWithString:info[kText]];
//        _createdDate = [[NSDate alloc] initWithTimeIntervalSince1970:[info[kCreatedDate] doubleValue]];
    }
    return self;
}

+ (instancetype)instanceFromDictionary:(NSDictionary *)aDictionary
{
    
    InstagramComment *instance = [[InstagramComment alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    
    return instance;
    
}

- (BOOL)isEqualToComment:(InstagramComment *)comment
{
    
    return [self isEqual:comment];
    
}

- (NSDictionary *)dictionaryRepresentation
{
    
    NSMutableDictionary *dict = @{}.mutableCopy;
    
    if(self.user)
    {
        [dict setObject:[self.user dictionaryRepresentation] forKey:@"user"];
    }
    
    if(self.text)
    {
        [dict setObject:self.text forKey:@"text"];
    }
    
    if(self.createdDate)
    {
        [dict setObject:self.createdDate forKey:@"createdDate"];
    }
    
    if(self.commentID)
    {
        [dict setObject:self.commentID forKey:@"id"];
    }
    
    return dict.copy;
    
}

#pragma mark - NSCoding

- (void)setValue:(id)value forKey:(NSString *)key
{
    
    if([key isEqualToString:@"createdDate"])
    {
        self.createdDate = [[NSDate alloc] initWithTimeIntervalSince1970:[value doubleValue]];
    }
    else
    {
        [super setValue:value forKey:key];
    }
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
    if([key isEqualToString:kCreator])
    {
        [self setValue:[InstagramUser instanceFromDictionary:value] forKey:@"user"];
    }
    else if ([key isEqualToString:kCreatedDate])
    {
        [self setValue:value forKey:@"createdDate"];
    }
    else if([key isEqualToString:@"id"])
    {
        [self setValue:value forKey:@"commentID"];
    }
    else
    {
        
    }
    
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (id)initWithCoder:(NSCoder *)decoder
{
    if ((self = [self init])) {
        _user = [decoder decodeObjectOfClass:[InstagramUser class] forKey:kCreator];
        _text = [decoder decodeObjectOfClass:[NSString class] forKey:kText];
        _createdDate = [decoder decodeObjectOfClass:[NSDate class] forKey:kCreatedDate];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:_user forKey:kCreator];
    [encoder encodeObject:_text forKey:kText];
    [encoder encodeObject:_createdDate forKey:kCreatedDate];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    InstagramComment *copy = [super copyWithZone:zone];
    copy->_user = [_user copy];
    copy->_text = [_text copy];
    copy->_createdDate = [_createdDate copy];
    return copy;
}

@end
