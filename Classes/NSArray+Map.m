//
//  NSArray+Map.m
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

#import "NSArray+Map.h"
#import "NSArray+Safe.h"

@implementation NSArray (Map)

- (NSArray *)arrayByMappingObjectsUsingBlock:(id (^)(id, NSUInteger, BOOL *))block
{
    __block NSMutableArray * newArray = [NSMutableArray new];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         [newArray addObjectSafely:block(obj, idx, stop)];
     }];
    
    return [newArray count] > 0 ? [newArray copy] : nil;
}

@end

@implementation NSSet (Map)

- (NSSet *)setByMappingObjectsUsingBlock:(id (^)(id, BOOL *))block
{
    NSMutableSet * set = [NSMutableSet new];
    
    [self enumerateObjectsUsingBlock:^(id obj, BOOL *stop)
    {
        id newObj = block(obj, stop);
        
        if (newObj)
        {
            [set addObject:newObj];
        }
    }];
    
    return [set copy];
}

@end