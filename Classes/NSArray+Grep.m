//
//  NSArray+Grep.m
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

#import "NSArray+Grep.h"
#import "NSArray+Map.h"

@implementation NSArray (Grep)

- (NSArray *)arrayByGreppingObjectsUsingBlock:(BOOL (^)(id, NSUInteger, BOOL *))test
{
    return [self arrayByMappingObjectsUsingBlock:^id(id obj, NSUInteger idx, BOOL *stop)
            {
                return test(obj, idx, stop) ? obj : nil;
            }];
}

@end

@implementation NSSet (Grep)

-(NSSet *)setByGreppingObjectsUsingBlock:(BOOL (^)(id, BOOL *))test
{
    return [self setByMappingObjectsUsingBlock:^id(id obj, BOOL *stop)
    {
        return test(obj, stop) ? obj : nil;
    }];
}

@end