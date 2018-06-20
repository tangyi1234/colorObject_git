//
//  TYDrawingPixelsViewController.m
//  color_Object
//
//  Created by 汤义 on 2018/6/19.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYDrawingPixelsViewController.h"
#import "TYDrawingPixelsView.h"
#import "TYDrawingPixels.h"
#import "TYPublicMethods.h"
@interface TYDrawingPixelsViewController ()
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation TYDrawingPixelsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)initView {

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, h - 200, w, 200)];
    [self.view addSubview:_imageView = imageView];
    
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.frame = CGRectMake(10, 64, 100, 30);
    but.backgroundColor = [UIColor redColor];
    [but setTitle:@"绘制图片" forState:UIControlStateNormal];
    [but addTarget:self action:@selector(selectorBut) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    UIButton *but1 = [UIButton buttonWithType:UIButtonTypeCustom];
    but1.frame = CGRectMake(120, 64, 100, 30);
    but1.backgroundColor = [UIColor yellowColor];
    [but1 setTitle:@"view绘制" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(selectorBut1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but1];
    
    UIButton *but2 = [UIButton buttonWithType:UIButtonTypeCustom];
    but2.frame = CGRectMake(w - 120, 64, 100, 30);
    but2.backgroundColor = [UIColor greenColor];
    [but2 setTitle:@"马赛克" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(selectorBut2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but2];
}

- (void)selectorBut {
//    _imageView.image = [TYDrawingPixels addImagePixel1:_imageView.image.CGImage];
    NSData *data = [TYPublicMethods addWithFilePathDataStr:@"25"];
//    [TYDrawingPixels addWithBlackWhiteImageData:data blackWhiteImage:^(CGImageRef imageRef) {
//         UIImage *newImage = [UIImage imageWithCGImage:imageRef];
//        _imageView.image = newImage;
//    }];
    
    UIImage *image = [UIImage imageWithData:data];
    _imageView.image = [TYDrawingPixels addImagePixel1:image.CGImage];
}

- (void)selectorBut1 {
    TYDrawingPixelsView *view = [TYDrawingPixelsView addDrawingPixelsView];
//    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (void)selectorBut2 {
    NSData *data = [TYPublicMethods addWithFilePathDataStr:@"25"];
    UIImage *image = [UIImage imageWithData:data];
    _imageView.image = [TYDrawingPixels imageProcess:image];
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
