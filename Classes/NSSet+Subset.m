//
//  NSSet+Subset.m
//  Pods
//
//  Created by Christian Otkjær on 09/01/15.
//
//

#import "NSSet+Subset.h"

@implementation NSSet (Subset)

- (NSSet *)createSubSetsOfSize:(NSUInteger)size
{
    NSLog(@"WARNING: Implement %@.%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
    return [[self createSubSets] filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"count == %@", size]];
}

- (NSSet *)createSubSets
{
    NSMutableSet * subsets = [NSMutableSet new];

    NSLog(@"WARNING: Implement %@.%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

    switch (self.count)
    {
        case 0:
        case 1:
            break;
            
        case 2:
            for (id obj in self)
            {
                [subsets addObject:obj];
            }
            break;
            
        default:
        {
            id obj = [self anyObject];
            
            [subsets addObject:obj];
            
            NSSet * otherSets = [[self filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"self != %@", obj]] createSubSets];
            
            for (id set in otherSets)
            {
                [subsets addObject:set];
                [subsets addObject:[set setByAddingObject:obj]];
            }
        }
            break;
    }
    
    return [subsets copy];
}

- (void)enumerateSubSetsUsingBlock:(void (^)(NSSet *, BOOL *))block
{
    NSLog(@"WARNING: Implement %@.%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));

}

@end
