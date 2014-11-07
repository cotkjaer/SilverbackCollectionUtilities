//
//  NSArray+Grep.h
//  Pods
//
//  Created by Christian Otkjær on 04/06/14.
//
//

@import Foundation;

@interface NSArray (Grep)

/**
 @brief Creates and returns a new array 'grepped' from this array
 
 Executes the test-block using each element in the array, starting with the first element and continuing through the array to the last object. The element is only added to the created array if the execution of the test-block has an @b YES return value.
 
 If the block parameter is nil this method will raise an exception.
 
 This method executes synchronously.
 
 @param test The test-block to apply to elements in the array.
 The test-block takes three arguments:
 @param obj The element in the array.
 @param idx The index of the element in the array.
 @param stop A reference to a BOOL value. The block can set the value to YES to stop further processing of the array. The stop argument is an out-only argument. Only ever set this BOOL within the block.
 
 @return A new array with only the elements in this array that passed the test.
 
 */
- (NSArray *)arrayByGreppingObjectsUsingBlock:(BOOL (^)(id obj, NSUInteger idx, BOOL *stop))test;


@end
