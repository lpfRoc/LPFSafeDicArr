//
//  NSMutableDictionary+Swizzling.m
//  LPFSafeDicArr
//
//  Created by Roc on 2017/3/23.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "NSMutableDictionary+Swizzling.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation NSMutableDictionary (Swizzling)
+(void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [objc_getClass("__NSDictionaryM") swizzleSelector:@selector(setValue:forKey:) withSwizzledSelector:@selector(safeSetValue:forKey:)];
        [objc_getClass("__NSDictionaryM") swizzleSelector:@selector(setObject:forKey:) withSwizzledSelector:@selector(safeSetObject:forKey:)];
        [objc_getClass("__NSDictionaryM") swizzleSelector:@selector(removeObjectForKey:) withSwizzledSelector:@selector(safeRemoveObjectForKey:)];
        
    });
}
- (void)safeSetValue:(id)value forKey:(NSString *)key
{
    if (key == nil || value == nil ) {
#if DEBUG
        NSAssert(NO, @"%s call -safeSetValue:forKey:, key或vale为nil", __FUNCTION__);

#endif
        return;
    }
    
    [self safeSetValue:value forKey:key];
}

- (void)safeSetObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    if (aKey == nil || anObject == nil ) {
#if DEBUG
        NSAssert(NO,@"%s call -safeSetObject:forKey:, key或vale为nil", __FUNCTION__);
#endif
        return;
    }
    
    [self safeSetObject:anObject forKey:aKey];
}

- (void)safeRemoveObjectForKey:(id)aKey
{
    if (aKey == nil  ) {
#if DEBUG
        NSAssert(NO,@"%s call -safeRemoveObjectForKey:, key为nil", __FUNCTION__);
#endif
        return;
    }
    [self safeRemoveObjectForKey:aKey];
}

@end
