//
//  NSArray+List.m
//  Pods
//
//  Created by Christian Otkjær on 11/12/14.
//
//

#import "NSArray+List.h"

@implementation NSArray (List)

- (id)head
{
    return [self firstObject];
}

- (NSArray *)tail
{
    switch ([self count])
    {
        case 0:
        case 1:
            return nil;
            break;
            
        default:
            return [self subarrayWithRange:NSMakeRange(1, self.count - 1)];
            break;
    }
}

@end


