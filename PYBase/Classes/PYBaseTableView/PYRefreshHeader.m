//
//  PYRefreshHeader.m
//  Pods
//
//  Created by yunhe.lin on 16/7/28.
//
//

#import "PYRefreshHeader.h"
#import "Masonry.h"

static NSString *kPullDownTitle = @"快往下拉";
static NSString *kPullDownTitleMore = @"放开我 我要发射了";
static NSString *kPullDownRefreshTip = @"正在刷新";
static CGFloat   kPYHeaderHeight = 64.f;
@interface PYRefreshHeader()

@property (nonatomic, strong) UIImageView *cycleImage;
@property (nonatomic, strong) UIImageView *arrowImage;
@property (nonatomic, assign) CGAffineTransform cycleTransform;
@property (nonatomic, assign) CGAffineTransform tipTransform;
@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation PYRefreshHeader

+ (instancetype)py_headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    PYRefreshHeader *cmp = [[self alloc] init];
    [cmp setRefreshingTarget:target refreshingAction:action];
    return cmp;
}

#pragma mark - override method 

- (void)prepare
{
    [super prepare];
    
    // 设置key
    self.lastUpdatedTimeKey = MJRefreshHeaderLastUpdatedTimeKey;
    
    // 设置高度
    self.mj_h = kPYHeaderHeight;
    self.isRefresh = NO;
    [self initSubView];
}

- (void)placeSubviews
{
    [super placeSubviews];
    // 设置y值(当自己的高度发生改变了，肯定要重新调整Y值，所以放到placeSubviews方法中设置y值)
    self.mj_y = - self.mj_h - self.ignoredScrollViewContentInsetTop;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    CGFloat kScale = -(self.scrollView.mj_offsetY / self.mj_h);
    self.cycleImage.transform = CGAffineTransformRotate(self.cycleTransform,2 * M_PI * kScale);
    self.tipLabel.transform = CGAffineTransformScale(CGAffineTransformIdentity, kScale > 1 ? 1 : kScale,  kScale > 1 ? 1 : kScale);
}

- (void)roateCycle
{
    [UIView animateWithDuration:0.05 animations:^{
        self.cycleImage.transform = CGAffineTransformRotate(self.cycleImage.transform,M_PI * 0.25);
    } completion:^(BOOL finished) {
        if (self.isRefresh) [self roateCycle];
    }];
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState;
    if (state == MJRefreshStateRefreshing) {
        self.isRefresh = YES;
        self.tipLabel.text = kPullDownRefreshTip;
        self.arrowImage.hidden = YES;
        [self roateCycle];
    } else {
        self.arrowImage.hidden = NO;
    }
    if (state == MJRefreshStateIdle) {
        self.tipLabel.text = kPullDownTitle;
        [self animateArrow:^{
            self.arrowImage.transform = CGAffineTransformIdentity;
        }];
    }
    if (state == MJRefreshStatePulling || state == MJRefreshStateWillRefresh) {
        self.tipLabel.text = kPullDownTitleMore;
        [self animateArrow:^{
           self.arrowImage.transform = CGAffineTransformRotate(self.arrowImage.transform,M_PI );
        }];
    }
    if (oldState == MJRefreshStateRefreshing) {
        self.isRefresh = NO;
        self.cycleImage.transform = CGAffineTransformIdentity;
    }
}

- (void)animateArrow:(void(^)())block
{
    [UIView animateWithDuration:0.3 animations:block];
}

- (void)initSubView
{
    [self addSubview:self.cycleImage];
    [self.cycleImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-5.f);
        make.centerX.equalTo(self);
    }];
    [self addSubview:self.arrowImage];
    [self.arrowImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.cycleImage);
    }];
    [self addSubview:self.tipLabel];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.cycleImage.mas_top).offset(-6);
        make.centerX.equalTo(self.cycleImage);
    }];
    self.cycleTransform = self.cycleImage.transform;
    self.tipTransform = self.tipLabel.transform;
}

- (UIImageView *)cycleImage
{
	if(_cycleImage == nil) {
		_cycleImage = [[UIImageView alloc] init];
        _cycleImage.backgroundColor = [UIColor clearColor];
        _cycleImage.image = [UIImage pyImageNamed:@"cycle"];
	}
	return _cycleImage;
}

- (UILabel *)tipLabel
{
	if(_tipLabel == nil) {
		_tipLabel = [[UILabel alloc] init];
        _tipLabel.textColor = [UIColor orangeColor];
        _tipLabel.font = [UIFont systemFontOfSize:12.f];
        _tipLabel.textAlignment = NSTextAlignmentLeft;
	}
	return _tipLabel;
}

- (UIImageView *)arrowImage
{
	if(_arrowImage == nil) {
		_arrowImage = [[UIImageView alloc] init];
        _arrowImage.image = [UIImage pyImageNamed:@"arrow"];
	}
	return _arrowImage;
}

@end
