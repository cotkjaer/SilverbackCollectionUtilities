//
//  NSArray+IndexPath.m
//  Pods
//
//  Created by Christian Otkjær on 10/12/14.
//
//

#import "NSArray+IndexPath.h"
#import "NSArray+Safe.h"

@implementation NSArray (IndexPath)

- (NSIndexPath *)indexPathOfObject:(id)anObject
{
    NSIndexPath * indexPath = nil;

    NSUInteger index = [self indexOfObject:anObject];
    
    if (index == NSNotFound)
    {
        for (index = 0; index < self.count; index++)
        {
            id object = self[index];
            
            if ([object respondsToSelector:@selector(indexPathOfObject:)])
            {
                NSIndexPath *childIndexPath = [object indexPathOfObject:anObject];
                
                if (childIndexPath)
                {
                    indexPath = [NSIndexPath indexPathWithIndex:index];
                    
                    for (index = 0; index < childIndexPath.length; index++)
                    {
                        indexPath = [indexPath indexPathByAddingIndex:[childIndexPath indexAtPosition:index]];
                    }

                    return indexPath;
                }
            }
        }
    }
    else
    {
        return [NSIndexPath indexPathWithIndex:index];
    }
    
    return nil;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath forPosition:(NSUInteger)position
{
    if (position < indexPath.length)
    {
        if (position == indexPath.length - 1)
        {
            return [self objectAtIndexSafely:[indexPath indexAtPosition:0]];
        }
        else
        {
            id object = [self objectAtIndexSafely:[indexPath indexAtPosition:0]];
            
            if ([object respondsToSelector:@selector(objectAtIndexPath:forPosition:)])
            {
                return [object objectAtIndexPath:indexPath forPosition:position + 1];
            }
        }
    }
    
    return nil;
}

- (id)objectAtIndexPath:(NSIndexPath *)indexPath
{
    return [self objectAtIndexPath:indexPath forPosition:0];
}

@end
