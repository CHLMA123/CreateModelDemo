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

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    [self setExclusiveTouchForButtons:self.view];
}

/**
 * UIView除了负责展示内容给用户外还负责响应用户事件。
 * userInteractionEnabled 默认是YES ，如果设置为NO则不响应用户事件，并且把当前控件从事件队列中删除。也就是说设置了userInterfaceEnabled属性的视图会打断响应者链导致该view的subview都无法响应事件。
 * multipleTouchEnabled  默认是NO，如果设置为YES则支持多点触碰。
 * exclusiveTouch 默认是NO，如果设置为YES则当前UIView会独占整个Touch事件。具体来说就是如果UIView设置了exclusiveTouch属性为YES,则当这个UIView成为第一响应者时，在手指离开屏幕前其他view不会响应任何touch事件。
 * 作用举例：UITableView的每个cell都需要使用exclusive，否则同时点击多个cell会触发每个视图的事件响应。手势识别会忽略此属性。
 */
/**
 * iOS 设置所有UIButton的ExclusiveTouch属性为YES
 */
-(void)setExclusiveTouchForButtons:(UIView *)myView
{
    for (UIView * v in [myView subviews]) {
        if([v isKindOfClass:[UIButton class]])
            [((UIButton *)v) setExclusiveTouch:YES];
        else if ([v isKindOfClass:[UIView class]]){
            [self setExclusiveTouchForButtons:v];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
