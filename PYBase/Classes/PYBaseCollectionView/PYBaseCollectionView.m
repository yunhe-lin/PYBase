//
//  PYBaseCollectionView.m
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import "PYBaseCollectionView.h"
#import "PYRefreshManager.h"
#import "MJRefresh.h"

@interface PYBaseCollectionView()

@property (nonatomic, strong) MJRefreshHeader *py_header;
@property (nonatomic, strong) MJRefreshBackFooter *py_footer;

@property (nonatomic, assign) PYCollectionViewRefreshType collectionRefreshType;

@end

@implementation PYBaseCollectionView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    if (self = [super initWithFrame:frame collectionViewLayout:layout]) {
        [self initCollectionView];
    }
    return self;
}

-  (void)initCollectionView
{
    self.backgroundColor = [UIColor whiteColor];
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

#pragma mark - public method 

- (void)setTableRefreshType:(PYCollectionViewRefreshType)refreshType
{
    _collectionRefreshType = refreshType;
    switch (refreshType) {
        case PYCollectionViewRefreshTypeNone:
        {
            self.mj_header = nil;
            self.mj_footer = nil;
            break;
        }
        case PYCollectionViewRefreshTypeHeader:
        {
            self.mj_header = self.py_header;
            self.mj_footer = nil;
            break;
        }
        case PYCollectionViewRefreshTypeFooter:
        {
            self.mj_header = nil;
            self.mj_footer = self.py_footer;
            break;
        }
        case PYCollectionViewRefreshTypeHeaderAndFooter:
        {
            self.mj_header = self.py_header;
            self.mj_footer = self.py_footer;
            break;
        }
        default:
            break;
    }
}

#pragma mark - accessors method 

- (MJRefreshBackFooter *)py_footer
{
    if (!_py_footer) {
        _py_footer = [PYRefreshManager py_footerRefresh:self action:@selector(footRefreshAction) refreshType:PYRefreshFooterTypeNormal];
    }
    return _py_footer;
}

- (MJRefreshHeader *)py_header
{
    if (!_py_header) {
        _py_header = [PYRefreshManager py_headerRefresh:self action:@selector(headRefreshAction) refreshType:PYRefreshHeaderTypeNormal];
    }
    return _py_header;
}

@end
