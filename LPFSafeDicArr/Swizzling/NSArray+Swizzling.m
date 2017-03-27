//
//  NSArray+Swizzling.m
//  LPFSafeDicArr
//
//  Created by Roc on 2017/3/22.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "NSArray+Swizzling.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation NSArray (Swizzling)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex:)];
    });
}

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
#if DEBUG
        NSAssert(NO, @"%s can't get any object from an empty array", __FUNCTION__);
#endif
        return nil;
    }
    if (index > self.count) {
#if DEBUG
        NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
#endif
        return nil;
    }
    return [self safeObjectAtIndex:index];
}
@end
