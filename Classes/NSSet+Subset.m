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
    return [[self subSets] filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"count == %@", size]];
}

- (NSSet *)subSets
{
    NSMutableSet * subsets = [NSMutableSet new];

    switch (self.count)
    {
        case 0:
        case 1:
            break;
            
        case 2:
            for (id obj in self)
            {
                [subsets addObject:[NSSet setWithObject:obj]];
            }
            break;
            
        default:
        {
            id element = [self anyObject];
            
            [subsets addObject:[NSSet setWithObject:element]];
            
            NSSet * otherElements = [self filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"self != %@", element]];

            [subsets addObject:otherElements];
            
            NSSet * otherSets = [otherElements subSets];
            
            for (id set in otherSets)
            {
                [subsets addObject:set];
                [subsets addObject:[set setByAddingObject:element]];
            }
        }
            break;
    }
    
    return [subsets copy];
}

- (void)enumerateSubSetsUsingBlock:(void (^)(NSSet *, BOOL *))block
{
    __block BOOL stop = NO;
    
    switch (self.count)
    {
        case 0:
        case 1:
            break;
            
        case 2:
            for (id obj in self)
            {
                block([NSSet setWithObject:obj], &stop);
                
                if (stop) break;
            }
            break;
            
        default:
        {
            id element = [self anyObject];
            
            block([NSSet setWithObject:element], &stop);
            
            if (!stop)
            {
                NSSet * otherElements = [self filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"self != %@", element]];
                
                block(otherElements, &stop);
                
                if (!stop)
                {
                    [otherElements enumerateSubSetsUsingBlock:^(NSSet *subSet, BOOL *stopSubsets)
                    {
                        block(subSet, stopSubsets);
                        
                        if (!*stopSubsets) block ([subSet setByAddingObject:element], stopSubsets);
                    }];
                }
            }
        }
            break;
    }

}

@end
