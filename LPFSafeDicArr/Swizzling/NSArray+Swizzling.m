//
//  NSArray+Swizzling.m
//  Laomoney
//
//  Created by Roc on 2019/3/22.
//  Copyright © 2019 zhengda. All rights reserved.
//

#import "NSArray+Swizzling.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation NSArray (Swizzling)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
#pragma 注视.对于NSArray来说 针对元素个数类名分为：__NSArrayI（大于一个元素）,__NSArray0（无元素）,__NSSingleObjectArrayI（只含一个元素）.但对于NSMutableArray来说都叫做__NSArrayM.
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex:)];
        [objc_getClass("__NSArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(safeObjectAtIndexedSubscript:)];
        
        //针对无元素
        [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeObjectAtIndex0:)];
        [objc_getClass("__NSArray0") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(safeObjectAtIndexedSubscript0:)];
        
        //针对单个元素
        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(objectAtIndexedSubscript:) withSwizzledSelector:@selector(safeSingleObjectAtIndexedSubscript:)];
        [objc_getClass("__NSSingleObjectArrayI") swizzleSelector:@selector(objectAtIndex:) withSwizzledSelector:@selector(safeSingleObjectAtIndex:)];
    });
}
- (id)safeObjectAtIndex0:(NSUInteger)index {
    
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        //            NSAssert(NO,@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog( @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        //            NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        return nil;
    }
    return [self safeObjectAtIndex0:index];
}

- (id)safeObjectAtIndexedSubscript0:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        //            NSAssert(NO,@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog( @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        //            NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        return nil;
    }
    return [self safeObjectAtIndexedSubscript0:index];
}
- (id)safeSingleObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        //            NSAssert(NO,@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog( @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        //            NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        return nil;
    }
    return [self safeSingleObjectAtIndex:index];
}

- (id)safeSingleObjectAtIndexedSubscript:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        //            NSAssert(NO,@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog( @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        //            NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        return nil;
    }
    return [self safeSingleObjectAtIndexedSubscript:index];
}
- (id)safeObjectAtIndex:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        //            NSAssert(NO,@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog( @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        //            NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        return nil;
    }
    return [self safeObjectAtIndex:index];
}

- (id)safeObjectAtIndexedSubscript:(NSUInteger)index {
    if (self.count == 0) {
        NSLog(@"%s can't get any object from an empty array", __FUNCTION__);
        //            NSAssert(NO,@"%s can't get any object from an empty array", __FUNCTION__);
        return nil;
    }
    if (index >= self.count) {
        NSLog( @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        //            NSAssert(NO, @"%s index = %zd out of bounds in array", __FUNCTION__,index);
        return nil;
    }
    return [self safeObjectAtIndexedSubscript:index];
}

@end
