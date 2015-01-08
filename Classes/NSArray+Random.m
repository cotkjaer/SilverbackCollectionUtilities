//
//  NSArray+Random.m
//  Silverback
//
//  Created by Christian Otkjær on 9/21/13.
//  Copyright (c) 2013 Silverback IT. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id)randomObject
{
    id randomObject = nil;
    
    NSUInteger count = [self count];
    
    if (count > 0)
    {
        randomObject = self[arc4random() % count];
    }
    
    return randomObject;
}

- (instancetype)arrayByShuffling
{
    NSMutableArray * mArray = [self mutableCopy];
    
    [mArray shuffle];
    
    return ([self isKindOfClass:[NSMutableArray class]]) ? mArray : [mArray copy];
}

@end

@implementation NSMutableArray (Random)

- (void)shuffle
{
    NSUInteger count = [self count];
    
    for (NSUInteger i = 0; i < count; ++i)
    {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end
