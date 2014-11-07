//
//  NSArray+Map.h
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

@import Foundation;

@interface NSArray (Map)

/**
 @brief Creates and returns a new array mapped from this array
 
 Executes the block using each object in the array, starting with the first object and continuing through the array to the last object. If the execution has a non-nil return value, that value is added to the created array.
 
 If the block parameter is nil this method will raise an exception.

 This method executes synchronously.
 
 @param block The block to apply to elements in the array.
 The block takes three arguments:
 @param obj The element in the array.
 @param idx The index of the element in the array.
 @param *stop A reference to a Boolean value. The block can set the value to YES to stop further processing of the array. The stop argument is an out-only argument. You should only ever set this Boolean to YES within the block.
 */
- (NSArray *)arrayByMappingObjectsUsingBlock:(id (^)(id obj, NSUInteger idx, BOOL *stop))block;

@end
