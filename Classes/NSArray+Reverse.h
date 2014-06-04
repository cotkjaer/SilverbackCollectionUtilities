//
//  NSArray+Reverse.h
//  Silverback
//
//  Created by Christian Otkjær on 9/21/13.
//  Copyright (c) 2013 Silverback IT. All rights reserved.
//

@interface NSArray (Reverse)

- (id)objectAtReverseIndex:(NSUInteger)index;

- (NSArray *)arrayByReversingOrder;

@end

@interface NSMutableArray (Reverse)

- (void)reverse;

@end