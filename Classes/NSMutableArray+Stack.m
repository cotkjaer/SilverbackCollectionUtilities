//
//  NSMutableArray+Stack.m
//  Pods
//
//  Created by Christian Otkjær on 12/01/15.
//
//

#import "NSMutableArray+Stack.h"

@implementation NSMutableArray (Stack)

- (void)push:(id)object
{
    [self addObject:object];
}

- (id)pop
{
    id object = [self lastObject];
    
    [self removeLastObject];
    
    return object;
}

- (id)peek:(NSUInteger)fromTop
{
    return self[self.count - (fromTop + 1)];
}

- (NSUInteger)height
{
    return self.count;
}

@end