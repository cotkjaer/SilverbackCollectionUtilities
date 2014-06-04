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
    NSMutableArray* newArray = [NSMutableArray new];
    
    BOOL stop = NO;
    
    NSUInteger idx = 0;
    
    while (!stop)
    {
        [newArray addObjectSafely:block(idx++, &stop)];
    }
    
    //TODO: check if this is called on the NSMutableArray or NSArray

    return [newArray count] > 0 ? [newArray copy] : nil;
}

@end
