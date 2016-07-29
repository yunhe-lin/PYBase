//
//  PYRefreshFooter.m
//  Pods
//
//  Created by yunhe.lin on 16/7/29.
//
//

#import "PYRefreshFooter.h"
#import "Masonry.h"

@interface PYRefreshFooter()

@property (nonatomic, strong) UIImageView *cycleImageView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, assign) BOOL isRefresh;

@end

@implementation PYRefreshFooter

+ (instancetype)footerWithRefreshingTarget:(id)target refreshingAction:(SEL)action
{
    PYRefreshFooter *cmp = [[PYRefreshFooter alloc] init];
    [cmp setRefreshingTarget:target refreshingAction:action];
    return cmp;
}

- (void)prepare
{
    [super prepare];
    [self initFooterView];
}

- (void)placeSubviews
{
    [super placeSubviews];
}

- (void)initFooterView
{
    self.isRefresh = NO;
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.cycleImageView];
    [self.cycleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self addSubview:self.leftImageView];
    [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self addSubview:self.rightImageView];
    [self.rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    // 当前的contentOffset
    CGFloat currentOffsetY = self.scrollView.mj_offsetY;
    CGFloat happenOffsetY = [self happenOffsetY];
    CGFloat diffOffestY = (currentOffsetY - happenOffsetY) > 0 ? (currentOffsetY - happenOffsetY) : 0;
    CGFloat kScale = diffOffestY / self.mj_h;
    if (self.isRefresh) return;
    [self changeTranform:kScale];
    
}

- (void)changeTranform:(CGFloat)kScale
{
    self.cycleImageView.transform = CGAffineTransformRotate(CGAffineTransformIdentity,2 * M_PI * kScale);
    if (kScale > 1) kScale = 2 - kScale;
    CGAffineTransform tranformLeft = CGAffineTransformTranslate(CGAffineTransformIdentity, self.mj_w / 2.0 * kScale, 0);
    tranformLeft =  CGAffineTransformRotate(tranformLeft, 2 * M_PI * kScale);
    self.leftImageView.transform = tranformLeft;
    
    CGAffineTransform tranformRight = CGAffineTransformTranslate(CGAffineTransformIdentity, -self.mj_w / 2.0 * kScale, 0);
    tranformRight =  CGAffineTransformRotate(tranformRight, -2 * M_PI * kScale);
    self.rightImageView.transform = tranformRight;
    
    
}

- (void)cycleRomte
{
    [UIView animateWithDuration:0.05 animations:^{
        self.cycleImageView.transform = CGAffineTransformRotate(self.cycleImageView.transform,M_PI * 0.25);
    } completion:^(BOOL finished) {
        if (self.isRefresh) [self cycleRomte];
    }];
}

- (void)setState:(MJRefreshState)state
{
    [super setState:state];
    if (MJRefreshStateNoMoreData == state) {
        self.mj_h = 0.0;
        self.cycleImageView.hidden = YES;
        self.leftImageView.hidden = YES;
        self.rightImageView.hidden = YES;
        return;
    }
    self.mj_h = MJRefreshFooterHeight;
    self.cycleImageView.hidden = NO;
    self.leftImageView.hidden = NO;
    self.rightImageView.hidden = NO;
    
    if (MJRefreshStateRefreshing == state) {
        self.isRefresh = YES;
        self.leftImageView.hidden = YES;
        self.rightImageView.hidden = YES;

        [self cycleRomte];
    } else {
        self.isRefresh = NO;
        self.cycleImageView.transform = CGAffineTransformIdentity;
        self.leftImageView.transform = CGAffineTransformIdentity;
        self.rightImageView.transform = CGAffineTransformIdentity;
    }
    
}

#pragma mark - 私有方法
#pragma mark 获得scrollView的内容 超出 view 的高度
- (CGFloat)heightForContentBreakView
{
    CGFloat h = self.scrollView.frame.size.height - self.scrollViewOriginalInset.bottom - self.scrollViewOriginalInset.top;
    return self.scrollView.contentSize.height - h;
}

#pragma mark 刚好看到上拉刷新控件时的contentOffset.y
- (CGFloat)happenOffsetY
{
    CGFloat deltaH = [self heightForContentBreakView];
    if (deltaH > 0) {
        return deltaH - self.scrollViewOriginalInset.top;
    } else {
        return - self.scrollViewOriginalInset.top;
    }
}


#pragma mark - accessors method

- (UIImageView *)cycleImageView
{
	if(_cycleImageView == nil) {
		_cycleImageView = [[UIImageView alloc] init];
        _cycleImageView.image = [UIImage pyImageNamed:@"cycle"];
	}
	return _cycleImageView;
}

- (UIImageView *)leftImageView
{
	if(_leftImageView == nil) {
		_leftImageView = [[UIImageView alloc] init];
        _leftImageView.image = [UIImage pyImageNamed:@"cycle"];
	}
	return _leftImageView;
}

- (UIImageView *)rightImageView
{
	if(_rightImageView == nil) {
		_rightImageView = [[UIImageView alloc] init];
        _rightImageView.image = [UIImage pyImageNamed:@"cycle"];
	}
	return _rightImageView;
}

@end
