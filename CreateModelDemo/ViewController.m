//
//  ViewController.m
//  CreateModelDemo
//
//  Created by MACHUNLEI on 2017/5/1.
//  Copyright © 2017年 MACHUNLEI. All rights reserved.
//

#import "ViewController.h"
#import "ModelTestA.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDictionary *dic = @{
                          @"id":@"11111",
                          @"name":@"chlma",
                          /*@"age":@"",*/
                          };
    ModelTestA *modelA = [[ModelTestA alloc] initModelWithDictionary:dic];
    NSLog(@"modelA = %@", [modelA description]);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
