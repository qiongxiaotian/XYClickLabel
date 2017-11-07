//
//  ViewController.m
//  部分label点击
//
//  Created by mxy on 2017/11/7.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "ViewController.h"
#import "XYClickLabel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    XYClickLabel *clickLabel = [[XYClickLabel alloc]initLabelViewWithLab:@"我是电线杆点击了文字" clickTextRange:NSMakeRange(3,3) clickAtion:^{
        NSLog(@" helloworld");
    }];
    
    [self.view addSubview:clickLabel];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
