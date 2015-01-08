//
//  NSArray+Functional.m
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

#import "NSArray+Functional.h"
#import "NSArray+Safe.h"

@implementation NSArray (Functional)

+ (instancetype)arrayWithBlock:(id (^)(NSUInteger, BOOL *))block
{
    NSMutableArray * newArray = [NSMutableArray new];
    
    BOOL stop = NO;
    
    NSUInteger idx = 0;
    
    while (!stop && idx < NSUIntegerMax)
    {
        [newArray addObjectSafely:block(idx++, &stop)];
    }

    if ([self isSubclassOfClass:[NSMutableArray class]])
    {
        return [newArray count] > 0 ? newArray : nil;
    }
    else
    {
        return [newArray count] > 0 ? [newArray copy] : nil;
    }
}

+ (instancetype)arrayWithSize:(NSUInteger)size
                        block:(id (^)(NSUInteger))block
{
    return [self arrayWithBlock:^id(NSUInteger idx, BOOL *stop)
    {
        if (idx < size)
        {
            return block(idx);
        }
        else
        {
            *stop = YES;
            return nil;
        }
    }];
}

+ (instancetype)arrayWithSize:(NSUInteger)size values:(id)value copy:(BOOL)copy
{
    if (copy && [value respondsToSelector:@selector(copy)])
    {
        return [self arrayWithSize:size block:^id(NSUInteger idx)
                {
                    return [value copy];
                }];
    }
    else
    {
        return [self arrayWithSize:size block:^id(NSUInteger idx)
                {
                    return value;
                }];
    }
}


@end
