//
//  PYBaseTableView.m
//  Pods
//
//  Created by yunhe.lin on 16/7/27.
//
//

#import "PYBaseTableView.h"
#import "MJRefresh.h"
#import "PYRefreshHeader.h"
#import "PYRefreshFooter.h"

@interface PYBaseTableView()

@property (nonatomic, strong) PYRefreshHeader *normalHeader;
@property (nonatomic, strong) PYRefreshFooter   *autoFooter;

@property (nonatomic, assign) PYTableViewRefreshType tableRefreshType;
@property (nonatomic, strong) UIView *blankView;

@end

@implementation PYBaseTableView

#pragma mark - override method

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self initTableView];
    }
    return self;
}

- (void)reloadData
{
    [super reloadData];
    BOOL showBlankView = [self mj_totalDataCount] < 0 && self.isShowBlankView;
    //TODO: 空白view 需要添加
}

#pragma mark - public method

- (void)setTableRefreshType:(PYTableViewRefreshType)refreshType
{
    _tableRefreshType = refreshType;
    switch (refreshType) {
        case PYTableViewRefreshTypeNone:
        {
            self.mj_header = nil;
            self.mj_footer = nil;
            break;
        }
        case PYTableViewRefreshTypeHeader:
        {
            self.mj_header = self.normalHeader;
            self.mj_footer = nil;
            break;
        }
        case PYTableViewRefreshTypeFooter:
        {
            self.mj_header = nil;
            self.mj_footer = self.autoFooter;
            break;
        }
        case PYTableViewRefreshTypeHeaderAndFooter:
        {
            self.mj_header = self.normalHeader;
            self.mj_footer = self.autoFooter;
            break;
        }
        default:
            break;
    }
}

#pragma mark - private method 

- (void)initTableView
{
    self.tableRefreshType = PYTableViewRefreshTypeHeaderAndFooter; // 默认需要上下拉刷新
    self.isShowBlankView = NO;
    self.hasMore = YES;
}

- (void)headRefreshAction
{
    if (self.headRefreshBlock) self.headRefreshBlock;
    [self performSelector:@selector(endHeadRefesh) withObject:nil afterDelay:2.0];
}

- (void)footRefreshAction
{
    if (self.footRefreshBlock) self.footRefreshBlock;
    [self performSelector:@selector(endFootRefresh) withObject:nil afterDelay:2.0];
}

- (void)endHeadRefesh
{
    [self.mj_header endRefreshing];
}

- (void)endFootRefresh
{
    [self.mj_footer endRefreshing];
    if (!self.hasMore) {
        [self.mj_footer endRefreshingWithNoMoreData];
    }
}

#pragma mark - accessors method 

- (PYRefreshHeader *)normalHeader
{
    if (!_normalHeader) {
        _normalHeader = [PYRefreshHeader py_headerWithRefreshingTarget:self refreshingAction:@selector(headRefreshAction)];
    }
    return _normalHeader;
}

- (PYRefreshFooter *)autoFooter
{
    if (!_autoFooter) {
        _autoFooter = [PYRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(footRefreshAction)];
    }
    return _autoFooter;
}

@end
