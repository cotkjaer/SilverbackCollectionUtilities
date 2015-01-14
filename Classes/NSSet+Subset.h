//
//  NSSet+Subset.h
//  Pods
//
//  Created by Christian Otkjær on 09/01/15.
//
//

@import Foundation;

@interface NSSet (Subset)

- (void)enumerateSubSetsUsingBlock:(void (^)(NSSet * subSet, BOOL *))block;

- (NSSet *)subSets;



@end

@interface SIPair : NSObject;

+ (instancetype)pairWithObject:(id)object1 andObject:(id)object2;

+ (instancetype)pairWithSet:(NSSet *)set;

+ (instancetype)pairWithArray:(NSArray *)array;

- (instancetype)initWithObject:(id)object1 andObject:(id)object2;

- (BOOL)containsObject:(id)object;

- (void)enumerateObjectsUsingBlock:(void (^)(id object, BOOL *stop))block;

- (BOOL)isEqualToPair:(SIPair *)otherPair;

@property (nonatomic, readonly) NSSet * set;

- (NSArray *)sortedArrayUsingDescriptors:(NSArray *)sortDescriptors;

@property (nonatomic, readonly) id anyObject;

- (NSString *)componentsJoinedByString:(NSString *)separator;

@end