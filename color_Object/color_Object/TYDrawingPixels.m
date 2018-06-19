//
//  TYDrawingPixels.m
//  color_Object
//
//  Created by 汤义 on 2018/6/19.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYDrawingPixels.h"
#define MaskB(x) ((x) & 0xFF)
#define R(x) (MaskB(x))
#define G(x) (MaskB(x >> 8))
#define B(x) (MaskB(x >> 16))
#define A(x) (MaskB(x >> 24))
#define RGBA(r,g,b,a) (MaskB(r) | MaskB(g)<<8 | MaskB(b) << 16 | MaskB(a) << 24)

@implementation TYDrawingPixels
+ (UIImage *)addImagePixel:(CGImageRef)imageRef {
    
    //创一个区域
    NSUInteger width = 100;
    NSUInteger height = 100;
    
    //创建颜色空间(开辟内存空间，目的：操作像素点)
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    //创建图片上下文
    UInt32 *inputPixels = (UInt32 *)calloc(width * height, sizeof(UInt32));
    
    CGContextRef contextRef = CGBitmapContextCreate(inputPixels, width, height, 8, 4 * width, colorSpaceRef, kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedLast);
//    //第四步：根据上下文绘制美白图片
//    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), imageRef);
    //第五部：正式开始美白
    
    //循环便利图片像素点
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            //获取当前图片的像素点 -->指针位移  inputPixels数组的首地址，不会变
            UInt32 *currnetPixels = inputPixels + (i * width) + j;
            //获取我们像素点对应的颜色值（*取值 &取地址）
            UInt32 color = *currnetPixels;
            //            NSLog(@"====%d====",color);
            UInt32 thisR,thisG,thisB,thisA;
//            thisR = *(currnetPixels + 0);
//            thisG = *(currnetPixels + 1);
//            thisB = *(currnetPixels + 2);
//            thisA = *(currnetPixels + 3);
//
//            thisR = 255 - 30;
//            thisG = 24;
//            thisB = 230;
//            thisA = 10;
            //定义亮度
            int lumi = 50;
            //如何获取
            //获取红色分量值（R）

            thisR = R(color);
            thisR = thisR + 2 * i;
            thisR = thisR > 255 ? 255 : thisR;
             NSLog(@"红色值：%d",thisR);
            //获取绿色分量值

            thisG = G(color);
            thisG = thisG + 30;
            thisG = thisG > 255 ? 255 : thisG;
            thisB = B(color);
            thisB = thisB + 80;
            thisB = thisB > 255 ? 255 : thisB;
            thisA = A(color);

            //修改像素点的值
            *currnetPixels = RGBA(thisR, thisG, thisB, thisA);
            
            
        }
    }
    
    
    //创建UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    //第七步：释放内存
    CGColorSpaceRelease(colorSpaceRef);
    CGContextRelease(contextRef);
    CGImageRelease(newImageRef);
    free(inputPixels);
   
    return newImage;
    
}

+ (UIImage *)addImagePixel1:(CGImageRef)imageRef {
    
    //创一个区域
//    NSUInteger width = 100;
//    NSUInteger height = 100;
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    
    //创建颜色空间(开辟内存空间，目的：操作像素点)
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    
    //创建图片上下文
    UInt32 *inputPixels = (UInt32 *)calloc(width * height, sizeof(UInt32));
    
    CGContextRef contextRef = CGBitmapContextCreate(inputPixels, width, height, 8, 4 * width, colorSpaceRef, kCGBitmapByteOrderDefault|kCGImageAlphaPremultipliedLast);
    //    //第四步：根据上下文绘制美白图片
    CGContextDrawImage(contextRef, CGRectMake(0, 0, width, height), imageRef);
    //第五步：获取图片的像素数组
//    unsigned char * bitMapData = CGBitmapContextGetData(contextRef);
    //第五部：正式开始美白
    
    //循环便利图片像素点
    for (int i = 0; i < height; i++) {
        for (int j = 0; j < width; j++) {
            //获取当前图片的像素点 -->指针位移  inputPixels数组的首地址，不会变
            UInt32 *currnetPixels = inputPixels + (i * width) + j;
            //获取我们像素点对应的颜色值（*取值 &取地址）
            UInt32 color = *currnetPixels;
            //            NSLog(@"====%d====",color);
            UInt32 thisR,thisG,thisB,thisA;
            //            thisR = *(currnetPixels + 0);
            //            thisG = *(currnetPixels + 1);
            //            thisB = *(currnetPixels + 2);
            //            thisA = *(currnetPixels + 3);
            //
            //            thisR = 255 - 30;
            //            thisG = 24;
            //            thisB = 230;
            //            thisA = 10;
            //定义亮度
            int lumi = 100;
            //如何获取
            //获取红色分量值（R）
            
            thisR = R(color);
            thisR = thisR + lumi;
            thisR = thisR > 255 ? 255 : thisR;
//            NSLog(@"红色值：%d",thisR);
            //获取绿色分量值
            
            thisG = G(color);
            thisG = thisG + lumi;
            thisG = thisG > 255 ? 255 : thisG;
            thisB = B(color);
            thisB = thisB + lumi;
            thisB = thisB > 255 ? 255 : thisB;
            thisA = A(color);
            
            //修改像素点的值
            *currnetPixels = RGBA(thisR, thisG, thisB, thisA);
            
            
        }
    }
    
//    //第七步：获取图片数据集合
//    NSUInteger size = width * height * 4;
//    CGDataProviderRef providerRef = CGDataProviderCreateWithData(NULL, bitMapData, size, NULL);
//    //第八部：创建马赛克图片
//    /*
//     参数1:宽
//     参数2:高
//     参数3:表示每一个像素点，每一个分量的大小
//     参数4:每一个像素点的大小
//     参数5:每一行内存大小
//     参数6:颜色空间
//     参数7:位图信息
//     参数8:数据源（数据集合）
//     参数9:数据解码器
//     参数10:是否抗锯齿
//     参数11:渲染器
//     */
//    CGImageRef mossicImageRef = CGImageCreate(width,
//                                              height,
//                                              8,
//                                              4*8,
//                                              width*4,
//                                              colorSpaceRef,kCGImageAlphaPremultipliedLast,
//                                              providerRef,
//                                              NULL,
//                                              NO,
//                                              kCGRenderingIntentDefault);
    
    
    //创建UIImage
    CGImageRef newImageRef = CGBitmapContextCreateImage(contextRef);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef];
    //第七步：释放内存
    CGColorSpaceRelease(colorSpaceRef);
    CGContextRelease(contextRef);
    CGImageRelease(newImageRef);
    free(inputPixels);
    
    return newImage;
    
}

+ (void)addWithBlackWhiteImageData:(NSData *)data blackWhiteImage:(imageRefBlackWhiteImageBlock)blackWhiteImage {
    if (!data) {
        return;
    }
    //获取source
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    //解码
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
    //复制代码
    //知识点CGImageRef
    /*
     sizt_t是定义的一个可移植性的单位，在64位机器中为8字节，32位位4字节。
     width：图片宽度像素
     height：图片高度像素
     bitsPerComponent：每个颜色的比特数，例如在rgba-32模式下为8
     bitsPerPixel：每个像素的总比特数
     bytesPerRow：每一行占用的字节数，注意这里的单位是字节
     space：颜色空间模式，例如const CFStringRef kCGColorSpaceGenericRGB 这个函数可以返回一个颜色空间对象。
     bitmapInfo：位图像素布局，这是个枚举
     provider：数据源提供者
     decode[]：解码渲染数组
     shouldInterpolate：是否抗锯齿
     intent：图片相关参数
     */
    size_t width  = CGImageGetWidth(imageRef);
    size_t height = CGImageGetHeight(imageRef);
    
    size_t bitsPerComponent = CGImageGetBitsPerComponent(imageRef);
    size_t bitsPerPixel = CGImageGetBitsPerPixel(imageRef);
    
    size_t bytesPerRow = CGImageGetBytesPerRow(imageRef);
    
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);
    
    CGBitmapInfo bitmapInfo = CGImageGetBitmapInfo(imageRef);
    
    
    bool shouldInterpolate = CGImageGetShouldInterpolate(imageRef);
    
    CGColorRenderingIntent intent = CGImageGetRenderingIntent(imageRef);
    
    CGDataProviderRef dataProvider = CGImageGetDataProvider(imageRef);
    
    CFDataRef dataRef = CGDataProviderCopyData(dataProvider);
    
    UInt8 *buffer = (UInt8*)CFDataGetBytePtr(dataRef);
    
    NSUInteger  x, y;
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8 *tmp;
            //将其转换为RGB格式
            tmp = buffer + y * bytesPerRow + x * 4;
            
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            
            UInt8 brightness;
            brightness = (77 * red + 28 * green + 151 * blue) / 256;
            if (y == (height/4) || y == (height/4)*3) {
                *(tmp + 0) = 0;
                *(tmp + 1) = 0;
                *(tmp + 2) = 0;
            }else if (x == (width/4) || x == (width/4)*3){
                *(tmp + 0) = 0;
                *(tmp + 1) = 0;
                *(tmp + 2) = 0;
            }
            
            
//            switch (type) {
//                case 1:
//                    brightness = (77 * red + 28 * green + 151 * blue) / 256;
//                    *(tmp + 0) = brightness;
//                    *(tmp + 1) = brightness;
//                    *(tmp + 2) = brightness;
//                    break;
//                case 2:
//                    *(tmp + 0) = red;
//                    *(tmp + 1) = green * 0.7;
//                    *(tmp + 2) = blue * 0.4;
//                    break;
//                case 3:
//                    *(tmp + 0) = 255 - red;
//                    *(tmp + 1) = 255 - green;
//                    *(tmp + 2) = 255 - blue;
//                    break;
//                case 4:
//                    *(tmp + 0) = red;
//                    *(tmp + 1) = 255 - green;
//                    *(tmp + 2) = 255 - blue;
//                    break;
//                default:
//                    *(tmp + 0) = red;
//                    *(tmp + 1) = green;
//                    *(tmp + 2) = blue;
//                    break;
//            }
        }
    }
    
    
    CFDataRef effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(dataRef));
    
    CGDataProviderRef effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef effectedCgImage = CGImageCreate(
                                               width, height,
                                               bitsPerComponent, bitsPerPixel, bytesPerRow,
                                               colorSpace, bitmapInfo, effectedDataProvider,
                                               NULL, shouldInterpolate, intent);
    
    if (!effectedCgImage) {
        return;
    }
    
    if (blackWhiteImage) {
        blackWhiteImage(effectedCgImage);
    }
    
    CGImageRelease(effectedCgImage);
    
    CFRelease(effectedDataProvider);
    
    CFRelease(effectedData);
    
    CFRelease(dataRef);
}
@end
