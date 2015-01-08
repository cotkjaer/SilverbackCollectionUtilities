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

+ (instancetype)arrayWithSize:(NSUInteger)size
                        block:(id (^)(NSUInteger idx))block;

+ (instancetype)arrayWithSize:(NSUInteger)size values:(id)value copy:(BOOL)copy;

@end
