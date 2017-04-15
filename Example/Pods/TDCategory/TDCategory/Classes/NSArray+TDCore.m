//
//  NSArray+TDCore.m
//  TDUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import "NSArray+TDCore.h"

@implementation NSArray (TDCore)

@end

#pragma mark - alloc
@implementation NSArray (alloc)

+ (NSArray *)td_withArary:(NSArray *)anArray
{
    return [[NSArray alloc] initWithArray:anArray];
}

@end


#pragma mark - Validate

@implementation NSArray (Validate)

- (BOOL)td_isEmpty
{
    return (self.count == 0);
}

- (BOOL)td_containClass:(Class)aClass
{
    for (id object in self) {
        if ( [object isKindOfClass:aClass]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)td_containObject:(id)anObject
{
    for (id object in self) {
        if ( [object isEqual:anObject]) {
            return YES;
        }
    }
    return NO;
}

@end

#pragma mark - Accessors

@implementation NSArray (Accessors)

- (id)td_objectAtIndex:(NSUInteger)index
{
    if ( ![self td_isEmpty] && self.count > index )
    {
        return [self objectAtIndex:index];
    }
    
    return nil;
}


- (NSInteger)td_indexOfObject:(id)anObject
{
    return [self indexOfObject:anObject];
}


- (id)td_objectOfClass:(Class)aClass
{
    for (id anObject in self) {
        if ([anObject isKindOfClass:aClass]) {
            return anObject;
        }
    }
    return nil;
}



@end


