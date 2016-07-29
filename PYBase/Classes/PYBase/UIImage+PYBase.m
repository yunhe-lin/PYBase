//
//  UIImage+PYBAse.m
//  Pods
//
//  Created by yunhe.lin on 16/7/28.
//
//

#import "UIImage+PYBase.h"
#import "NSBundle+PYBase.h"

@implementation UIImage (PYBase)

+ (UIImage *)pyImageNamed:(NSString *)imageName
{
    return [self my_imageNamed:imageName inBundle:[NSBundle py_refreshBundle]];
}

+ (UIImage *)my_imageNamed:(NSString *)name inBundle:(NSBundle *)bundle {
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
    return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
#elif __IPHONE_OS_VERSION_MAX_ALLOWED < __IPHONE_8_0
    return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
#else
    if ([UIImage respondsToSelector:@selector(imageNamed:inBundle:compatibleWithTraitCollection:)]) {
        return [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    } else {
        return [UIImage imageWithContentsOfFile:[bundle pathForResource:name ofType:@"png"]];
    }
#endif
}

@end
