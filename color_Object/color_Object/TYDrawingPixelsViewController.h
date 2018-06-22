//
//  TYDrawingPixelsViewController.h
//  color_Object
//
//  Created by 汤义 on 2018/6/19.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum _TYStyle{
    BlackWhite = 0,
    Mosaic,
    WhiteDots,
    CutSize,
} TYStyle;
@interface TYDrawingPixelsViewController : UIViewController
@property (nonatomic, assign) TYStyle style;
@end
