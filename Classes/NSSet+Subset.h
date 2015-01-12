//
//  NSSet+Subset.h
//  Pods
//
//  Created by Christian Otkjær on 09/01/15.
//
//

#import <Foundation/Foundation.h>

@interface NSSet (Subset)

- (void)enumerateSubSetsUsingBlock:(void (^)(NSSet * subSet, BOOL *))block;

- (NSSet *)subSets;

@end
