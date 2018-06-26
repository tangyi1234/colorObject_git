//
//  TYRGBDrawingPixels.m
//  color_Object
//
//  Created by 汤义 on 2018/6/25.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYRGBDrawingPixels.h"

@implementation TYRGBDrawingPixels
+ (UIImage *)addRGBType:(int)type imageRefData:(NSData *)data {
    if (!data) {
        return nil;
    }
    //获取source
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    //解码
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
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
    //遍历出每一个像素
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
            
            switch (type) {
                case 0:
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = 0;
                    *(tmp + 2) = 0;
                    break;
                case 1:
                    *(tmp + 0) = 0;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = 0;
                    break;
                case 2:
                    *(tmp + 0) = 0;
                    *(tmp + 1) = 0;
                    *(tmp + 2) = brightness;
                    break;
                    
                default:
                    *(tmp + 0) = brightness;
                    *(tmp + 1) = brightness;
                    *(tmp + 2) = brightness;
                    break;
            }
            
        }
    }
    
    
    CFDataRef effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(dataRef));
    
    CGDataProviderRef effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef effectedCgImage = CGImageCreate(
                                               width, height,
                                               bitsPerComponent, bitsPerPixel, bytesPerRow,
                                               colorSpace, bitmapInfo, effectedDataProvider,
                                               NULL, shouldInterpolate, intent);
    UIImage *outImage = [UIImage imageWithCGImage:effectedCgImage];
    
    if (!effectedCgImage) {
        return nil;
    }
    
    CGImageRelease(effectedCgImage);
    
    CFRelease(effectedDataProvider);
    
    CFRelease(effectedData);
    
    CFRelease(dataRef);
    
    return outImage;
}

+ (UIImage *)addBinarizationData:(NSData *)data {
    if (!data) {
        return nil;
    }
    //获取source
    CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
    
    //解码
    CGImageRef imageRef = CGImageSourceCreateImageAtIndex(source, 0, NULL);
    
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
    //遍历出每一个像素
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            UInt8 *tmp;
            //将其转换为RGB格式
            tmp = buffer + y * bytesPerRow + x * 4;
            
            UInt8 red,green,blue;
            red = *(tmp + 0);
            green = *(tmp + 1);
            blue = *(tmp + 2);
            if (red < 127) {
                *(tmp + 0) = 0;
                *(tmp + 1) = 0;
                *(tmp + 2) = 0;
            }else{
                *(tmp + 0) = 255;
                *(tmp + 1) = 255;
                *(tmp + 2) = 255;
            }
          
            
        }
    }
    
    
    CFDataRef effectedData = CFDataCreate(NULL, buffer, CFDataGetLength(dataRef));
    
    CGDataProviderRef effectedDataProvider = CGDataProviderCreateWithCFData(effectedData);
    
    CGImageRef effectedCgImage = CGImageCreate(
                                               width, height,
                                               bitsPerComponent, bitsPerPixel, bytesPerRow,
                                               colorSpace, bitmapInfo, effectedDataProvider,
                                               NULL, shouldInterpolate, intent);
    UIImage *outImage = [UIImage imageWithCGImage:effectedCgImage];
    
    if (!effectedCgImage) {
        return nil;
    }
    
    CGImageRelease(effectedCgImage);
    
    CFRelease(effectedDataProvider);
    
    CFRelease(effectedData);
    
    CFRelease(dataRef);
    
    return outImage;
}
@end
