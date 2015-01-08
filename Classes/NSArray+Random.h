//
//  NSArray+Random.h
//  Silverback
//
//  Created by Christian Otkjær on 9/21/13.
//  Copyright (c) 2013 Silverback IT. All rights reserved.
//

@interface NSArray (Random)

- (id)randomObject;

- (instancetype)arrayByShuffling;

@end

@interface NSMutableArray (Random)

- (void)shuffle;

@end


