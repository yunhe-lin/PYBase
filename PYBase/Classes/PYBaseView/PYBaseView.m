//
//  PYBaseView.m
//  Pods
//
//  Created by yunhe.lin on 16/7/27.
//
//

#import "PYBaseView.h"

@implementation PYBaseView

- (instancetype)init
{
    if (self = [super init]) {
        [self initViewUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initViewUI];
    }
    return self;
}

- (void)initViewUI{};

@end
