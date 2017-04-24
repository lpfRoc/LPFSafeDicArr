//
//  NSDictionary+Swizzling.m
//  LPFSafeDicArr
//
//  Created by Roc on 2017/3/23.
//  Copyright © 2017年 Roc. All rights reserved.
//

#import "NSDictionary+Swizzling.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
@implementation NSDictionary (Swizzling)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        [objc_getClass("__NSPlaceholderDictionary") swizzleSelector:@selector(initWithObjects:forKeys:count:) withSwizzledSelector:@selector(safeInitWithObjects:forKeys:count:)];
        
//     避免系统自身点用此方法，被拦截
//        [objc_getClass("__NSDictionaryI") swizzleSelector:@selector(objectForKey:) withSwizzledSelector:@selector(safeObjectForKey:)];
    });
}

- (instancetype)safeInitWithObjects:(const id  _Nonnull  __unsafe_unretained *)objects forKeys: (const id  _Nonnull  __unsafe_unretained *)keys count:(NSUInteger)cnt
{
    BOOL hasNilObject = NO;
    for (NSUInteger i = 0; i < cnt; i++) {
        if (objects[i] == nil || keys[i] == nil) {
            hasNilObject = YES;
#if DEBUG
            // 如果可以对数组中为nil的元素信息打印出来，增加更容    易读懂的日志信息，这对于我们改bug就好定位多了
            NSString *errorMsg = [NSString     stringWithFormat:@"数组元素不能为nil，其index为: %lu", i];
            NSAssert(NO, @"%s %@",__FUNCTION__,errorMsg);
            
#endif
        }
    }
    
    // 因为有值为nil的元素，那么我们可以过滤掉值为nil的元素
    if (hasNilObject) {
        id __unsafe_unretained newObjects[cnt];
        id __unsafe_unretained newKeys[cnt];
        NSUInteger index = 0;
           NSUInteger keyIndex = 0;
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (objects[i] != nil && keys[i] != nil) {
                newObjects[index++] = objects[i];
            }
        }
        for (NSUInteger i = 0; i < cnt; ++i) {
            if (keys[i] != nil && objects[i] != nil) {
                newKeys[keyIndex++] = keys[i];
            }
        }
        return [self safeInitWithObjects:newObjects forKeys:newKeys count:index];
    }
    return [self safeInitWithObjects:objects forKeys:keys count:cnt];
}

//- (nullable id)safeObjectForKey:(NSString *)key
//{
//    if (key == nil ||  [self safeObjectForKey:key] == nil ) {
//#if DEBUG
//            NSAssert(NO, @"%s call -safeSetObject:forKey:, key或vale为nil", __FUNCTION__);
//#endif
//        return nil;
//    }
//    
//    return [self safeObjectForKey:key];
//}
@end
