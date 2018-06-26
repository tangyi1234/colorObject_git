//
//  ViewController.m
//  color_Object
//
//  Created by 汤义 on 2018/6/19.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "ViewController.h"
#import "TYDrawingPixelsViewController.h"
#import "TYIntegrationDataViewController.h"
#import "TYRGBViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initView];
}

- (void)initView {
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 100, 100, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"跳转像数" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(10, 140, 100, 30);
    but1.backgroundColor = [UIColor greenColor];
    [but1 setTitle:@"样式全解" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(10, 180, 100, 30);
    but2.backgroundColor = [UIColor greenColor];
    [but2 setTitle:@"RGB" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(selectorBut2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
}

- (void)selectorBut {
    TYDrawingPixelsViewController *vc = [[TYDrawingPixelsViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)selectorBut1 {
    TYIntegrationDataViewController *vc = [[TYIntegrationDataViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)selectorBut2 {
    TYRGBViewController *vc = [[TYRGBViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
