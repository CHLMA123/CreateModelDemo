//
//  ModelTestA.h
//  CreateModelDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModelTestA : NSObject

@property (nonatomic, strong) NSString *mainId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *age;

- (instancetype)initModelWithDictionary:(NSDictionary *)dict;

@end
