//
//  ModelTestC.m
//  CreateModelDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "ModelTestC.h"
#import <objc/runtime.h>

@implementation ModelTestC

#pragma mark - public methods
- (instancetype)initModelWithDictionary:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
//    if ([key isEqualToString:@"name"]) {
//        _name1 = [NSString stringWithFormat:@"%@", value];
//    }
}

#pragma mark - private methods
- (NSString *)description{
    return [NSString stringWithFormat:@"%@", [self allPropertyNamesAndValues]];
}

- (NSString *)debugDescription{
    return [NSString stringWithFormat:@"%@", [self allPropertyNamesAndValues]];
}

/**
 * 返回当前类的所有属性及Value值
 */
- (NSDictionary *)allPropertyNamesAndValues{
    
    NSMutableDictionary *resultDict = [NSMutableDictionary dictionary];
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (int i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        const char *name = property_getName(property);
        // 得到属性名
        NSString *propertyName = [NSString stringWithUTF8String:name];
        // 获取属性值
        id propertyValue = [self valueForKey:propertyName];
        if (propertyValue && propertyValue != nil) {
            [resultDict setObject:propertyValue forKey:propertyName];
        }
    }
    // 记得释放
    free(properties);
    return resultDict;
}

@end
