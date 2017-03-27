//
//  NSObject+Swizzling.h
//  LPFSafeDicArr
//
//  Created by Roc on 2017/3/22.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSObject (Swizzling)

+ (void)swizzleSelector:(SEL)originalSelector withSwizzledSelector:(SEL)swizzledSelector;

@end
