//
//  NSMutableArray+Stack.h
//  Pods
//
//  Created by Christian Otkjær on 12/01/15.
//
//

@import Foundation;

@interface NSMutableArray (Stack)

- (void)push:(id)object;

- (id)pop;

- (id)peek:(NSUInteger)fromTop;

@property (nonatomic, readonly) NSUInteger height;

@end

typedef NSMutableArray SIStack;