//
//  NSArray+IndexPath.h
//  Pods
//
//  Created by Christian Otkjær on 10/12/14.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (IndexPath)

- (NSIndexPath *)indexPathOfObject:(id)anObject;

- (id)objectAtIndexPath:(NSIndexPath *)indexPath;

@end
