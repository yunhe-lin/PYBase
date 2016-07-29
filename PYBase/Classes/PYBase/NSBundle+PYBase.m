//
//  NSBundle+PYBase.m
//  Pods
//
//  Created by yunhe.lin on 16/7/28.
//
//

#import "NSBundle+PYBase.h"
#import "PYRefreshHeader.h"

@implementation NSBundle (PYBase)

+ (instancetype)py_refreshBundle
{
    NSBundle *pyBundle = nil;
    if (pyBundle == nil) {
        // 这里不使用mainBundle是为了适配pod 1.x和0.x
        pyBundle = [NSBundle bundleWithPath:[[NSBundle bundleForClass:[PYRefreshHeader class]] pathForResource:@"PYBase" ofType:@"bundle"]];
    }
    return pyBundle;
}

@end
