//
//  NSArray+List.h
//  Pods
//
//  Created by Christian Otkjær on 11/12/14.
//
//

@import Foundation;

@interface NSArray (List)

- (id)head;

- (NSArray *)tail;

- (NSString *)componentsJoinedByString:(NSString *)separator
                           finalString:(NSString *)finalSeparator;

@end

