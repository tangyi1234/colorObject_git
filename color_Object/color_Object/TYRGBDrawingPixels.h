//
//  TYRGBDrawingPixels.h
//  color_Object
//
//  Created by 汤义 on 2018/6/25.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TYRGBDrawingPixels : NSObject
+ (UIImage *)addRGBType:(int)type imageRefData:(NSData *)data;
//真正的黑和白
+ (UIImage *)addBinarizationData:(NSData *)data;
@end
