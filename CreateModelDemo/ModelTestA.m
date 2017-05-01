//
//  ModelTestA.m
//  CreateModelDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "ModelTestA.h"
#import <objc/runtime.h>

@implementation ModelTestA

- (instancetype)initModelWithDictionary:(NSDictionary *)dict{
    
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        _mainId = [NSString stringWithFormat:@"%@", value];
    }
}

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

/**
 * 返回当前类的所有属性
 */
- (NSArray *)allProperties{

    // 获取类的所有属性
    // 如果没有属性，则count为0，properties为nil
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count; i++) {
        // An opaque type that represents an Objective-C declared property.
        // objc_property_t 属性类型
        objc_property_t property = properties[i];
        // 获取属性的名称 C语言字符串
        const char *cName = property_getName(property);
        // 转换为Objective C 字符串
        NSString *name = [NSString stringWithCString:cName encoding:NSUTF8StringEncoding];
        [propertiesArray addObject:name];
    }
    // 注意，这里properties是一个数组指针，是C的语法，
    // 我们需要使用free函数来释放内存，否则会造成内存泄露
    free(properties);
    return [propertiesArray copy];
}

@end
