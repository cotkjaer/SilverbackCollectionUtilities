//
//  NSArray+Random.m
//  Silverback
//
//  Created by Christian Otkjær on 9/21/13.
//  Copyright (c) 2013 Silverback IT. All rights reserved.
//

#import "NSArray+Random.h"

@implementation NSArray (Random)

- (id)randomObject
{
    id randomObject = nil;
    
    NSUInteger count = [self count];
    
    if (count > 0)
    {
        randomObject = self[arc4random() % count];
    }
    
    return randomObject;
}

@end
