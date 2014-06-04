//
//  NSArray+Map.m
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

#import "NSArray+Map.h"

@implementation NSArray (Map)

- (NSArray *)arrayByMappingObjectsUsingBlock:(id (^)(id, NSUInteger, BOOL *))block
{
    __block NSMutableArray* newArray = [NSMutableArray new];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         id newObject = block(obj, idx, stop);
         
         if (newObject != nil)
         {
             [newArray addObject:newObject];
         }
     }];
    
    return [newArray count] > 0 ? [newArray copy] : nil;
}

@end
