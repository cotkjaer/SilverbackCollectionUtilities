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

@interface SIPair ()

@property (nonatomic, strong) NSSet * set;

@end

@implementation SIPair

+ (instancetype)pairWithObject:(id)object1 andObject:(id)object2
{
    return [[self alloc] initWithObject:object1 andObject:object2];
}

+ (instancetype)pairWithSet:(NSSet *)set
{
    if (set.count == 2)
    {
        return [self pairWithArray:set.allObjects];
    }
    
    return nil;
}

+ (instancetype)pairWithArray:(NSArray *)array
{
    if (array.count == 2)
    {
        return [[self alloc] initWithObject:array[0] andObject:array[1]];
    }
    
    return nil;
}

- (instancetype)initWithObject:(id)object1 andObject:(id)object2
{
    if ((object1 == nil) || (object2 == nil))
    {
        NSLog(@"WARNING: Could not create pair from  %@ and %@", object1, object2);

        return nil;
    }
    
    self = [super init];
    
    if (self)
    {
        _set = [NSSet setWithObjects:object1, object2, nil];
    }
    
    return self;
}

- (BOOL)containsObject:(id)object
{
    return [self.set containsObject:object];
}

- (void)enumerateObjectsUsingBlock:(void (^)(id, BOOL *))block
{
    [self.set enumerateObjectsUsingBlock:block];
}

- (BOOL)isEqualToPair:(SIPair *)otherPair
{
    if ([otherPair isMemberOfClass:[self class]])
    {
        return [self.set isEqualToSet:otherPair.set];
    }
    
    return NO;
}

- (BOOL)isEqual:(id)object
{
    return [self isEqualToPair:object];
}

- (NSUInteger)hash
{
    return self.set.hash;
}

- (NSArray *)sortedArrayUsingDescriptors:(NSArray *)sortDescriptors
{
    return [self.set sortedArrayUsingDescriptors:sortDescriptors];
}


- (id)anyObject
{
    return [self.set anyObject];
}

- (NSString *)description
{
    NSMutableArray * descriptions = [NSMutableArray new];
    
    [self enumerateObjectsUsingBlock:^(id object, BOOL *stop)
    {
        [descriptions addObject:[object description]];
    }];
    
    return [NSString stringWithFormat:@"(%@)", [descriptions componentsJoinedByString:@","]];
}

- (NSString *)componentsJoinedByString:(NSString *)separator
{
    return [self.set.allObjects componentsJoinedByString:separator];
}

@end
