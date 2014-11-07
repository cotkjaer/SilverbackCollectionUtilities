//
//  NSArray+Reverse.m
//  Silverback
//
//  Created by Christian Otkjær on 9/21/13.
//  Copyright (c) 2013 Silverback IT. All rights reserved.
//

#import "NSArray+Reverse.h"
#import "NSArray+Safe.h"

@implementation NSArray (Reverse)

- (id)objectAtReverseIndex:(NSUInteger)index
{
    id objectAtReverseIndex = [self objectAtIndexSafely:[self count] - (1 + index)];
    
    return objectAtReverseIndex;
}

- (NSArray *)arrayByReversingOrder
{
    NSMutableArray * mutableSelf = [self mutableCopy];
    
    [mutableSelf reverse];
    
    return [mutableSelf copy];
}

@end

@implementation NSMutableArray (Reverse)

- (void)reverse
{
    NSUInteger count = [self count];
    
    if (count > 0)
    {
        for (NSUInteger i = 0, j = count - 1; i < j; i++, j--)
        {
            [self exchangeObjectAtIndex:i
                      withObjectAtIndex:j];
        }
    }
}

@end