//
//  TYRGBViewController.m
//  color_Object
//
//  Created by 汤义 on 2018/6/25.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYRGBViewController.h"
#import "TYRGBDrawingPixels.h"
#import "TYPublicMethods.h"

@interface TYRGBViewController ()
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation TYRGBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)initView {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, h - 300, w, 250)];
    [self.view addSubview:_imageView = imageView];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 64, 100, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"RGB" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(w - 110, 64, 100, 30);
    but1.backgroundColor = [UIColor yellowColor];
    [but1 setTitle:@"黑白色" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
}

- (void)selectorBut {
    NSData *data = [TYPublicMethods addWithFilePathDataStr:@"25"];
    _imageView.image = [TYRGBDrawingPixels addRGBType:8 imageRefData:data];
}

- (void)selectorBut1 {
//    NSData *data = [TYPublicMethods addWithFilePathDataStr:@"25"];
    NSData *data = UIImagePNGRepresentation(_imageView.image);
    _imageView.image = [TYRGBDrawingPixels addBinarizationData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
