//
//  NSArray+Functional.h
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

@import Foundation;

@interface NSArray (Functional)

+ (instancetype)arrayWithBlock:(id (^)(NSUInteger idx, BOOL *stop))block;

@end
