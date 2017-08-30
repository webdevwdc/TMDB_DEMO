

#import "NSDictionary+CustomDict.h"

@implementation NSDictionary (CustomDict)

- (id)objectForKeyCheckNull:(id)aKey{
    id object = [self objectForKey:aKey];
    
    NSString *strValue = @"";
    if (![object isKindOfClass:[NSNull class]]) {
        strValue =[self objectForKey:aKey];
    }
    
    return  strValue;
}

- (id)objectForKeyOrNil:(id)akey {
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return @"";
    }
    if ([object isKindOfClass:[NSString class]]) {
        return object;
    } else {
        return nil;
    }
}

- (BOOL)isObjectForKeyNil:(id)akey {
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return YES;
    }
    
    return NO;
}

- (BOOL)isObjectForKeyArray:(id)akey
{
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return NO;
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL)isObjectForKeyString:(id)akey
{
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return NO;
    }
    
    if ([object isKindOfClass:[NSString class]]) {
        return YES;
    } else {
        return NO;
    }
}


- (BOOL)isObjectForKeyDict:(id)akey
{
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return NO;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return YES;
    } else {
        return NO;
    }
}

//

- (NSString *)objectForKeyString:(id)akey
{
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return @"";
    }
    
    if ([object isKindOfClass:[NSString class]]) {
        return [self objectForKey:akey];
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        return [[self objectForKey:akey] description];
    }
    else {
        return @"";
    }
}

- (id)objectOrNilForKey:(id)akey
{
    id object = [self objectForKey:akey];
    
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    return object;
}

- (NSArray *)objectForKeyArray:(id)akey
{
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return nil;
    }
    
    if ([object isKindOfClass:[NSArray class]]) {
        return [self objectForKey:akey];
    } else {
        return nil;
    }
}

- (NSDictionary *)objectForKeyDict:(id)akey
{
    id object = [self objectForKey:akey];
    if (object == nil ) {
        return nil;
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return [self objectForKey:akey];
    } else {
        return nil;
    }
}

- (BOOL)objectForKeyBool:(id)akey
{
    return [[self objectForKeyString:akey] boolValue];
}

- (NSInteger)objectForKeyInt:(id)akey
{
    return [[self objectForKeyString:akey] integerValue];
}
@end
