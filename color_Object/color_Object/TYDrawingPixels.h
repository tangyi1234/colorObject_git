//
//  TYDrawingPixels.h
//  color_Object
//
//  Created by 汤义 on 2018/6/19.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef void (^imageRefBlackWhiteImageBlock) (CGImageRef imageRef);
@interface TYDrawingPixels : NSObject
//绘制图片
+ (UIImage *)addImagePixel:(CGImageRef)imageRef;
+ (UIImage *)addImagePixel1:(CGImageRef)imageRef;
+ (void)addWithBlackWhiteImageData:(NSData *)data blackWhiteImage:(imageRefBlackWhiteImageBlock)blackWhiteImage;
//打马赛克
+ (UIImage*)imageProcess:(UIImage*)image;

//黑白图
+ (UIImage *)addBlackWhite:(NSData *)data;
//还原黑白
+ (UIImage *)addReduction:(CGImageRef)imageRef;
//裁剪图片
+ (UIImage *)addWithCutOutPictures:(NSData *)data tailoring:(CGSize)size;
@end
