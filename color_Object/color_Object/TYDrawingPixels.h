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
@end
