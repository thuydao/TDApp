//
//  NSArray+TDCore.h
//  TDUtils
//
//  Created by thuydd on 1/27/15.
//  Copyright (c) 2015 SmartOSC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSArray (TDCore)

@end

#pragma mark - alloc
@interface NSArray (alloc)

+ (NSArray *)td_withArary:(NSArray *)anArray;

@end

#pragma mark - Validate

@interface NSArray (Validate)

- (BOOL)td_isEmpty;
- (BOOL)td_containClass:(Class)aClass;
- (BOOL)td_containObject:(id)anObject;

@end

#pragma mark - Accessors

@interface NSArray (Accessors)

- (id)td_objectAtIndex:(NSUInteger)index;
- (NSInteger)td_indexOfObject:(id)anObject;
- (id)td_objectOfClass:(Class)aClass;


@end
