//
//  ViewController.m
//  MenuDemo
//
//  Created by zhou on 13-12-7.
//  Copyright (c) 2013年 zhou. All rights reserved.
//

#import "ViewController.h"

#import "KxMenu.h"

@interface ViewController () {
    
    UIButton* myButton;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [super viewDidLoad];
	// 类型 和 边界
    myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGRect frame = CGRectMake(10, 416, 80, 44);
    myButton.frame = frame;
    // 标题
    [myButton setTitle:@"弹出" forState:UIControlStateNormal];
    [self.view addSubview:myButton];
    // 添加方法
    [myButton addTarget:self action:@selector(showMenu:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)showMenu:(UIButton*)sender {
    // 菜单选项
    NSArray* menuItems = [NSArray arrayWithObjects:
                          [KxMenuItem menuItem:@"All Items" image:nil target:nil action:nil],
                          [KxMenuItem menuItem:@"Monday" image:nil target:self action:@selector(presentMenuItem:)],
                          [KxMenuItem menuItem:@"Tuesday" image:nil target:self action:@selector(presentMenuItem:)], nil];
    // 首项字体 颜色 文字位置
    KxMenuItem* firstItem = [menuItems objectAtIndex:0];
    firstItem.foreColor = [UIColor colorWithRed:47/255.0f green:112/255.0f blue:225/225.0f alpha:1.0];
    firstItem.alignment = NSTextAlignmentCenter;
    // 显示二级菜单
    [KxMenu showMenuInView:self.view fromRect:sender.frame menuItems:menuItems];
    // 结束
}

- (void)presentMenuItem:(id)sender {
    
    NSLog(@"%@",sender);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
