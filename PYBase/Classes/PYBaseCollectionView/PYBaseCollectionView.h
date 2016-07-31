//
//  PYBaseCollectionView.h
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import <UIKit/UIKit.h>

@class PYRefreshManager;

typedef NS_ENUM(NSInteger, PYCollectionViewRefreshType) {
    PYCollectionViewRefreshTypeNone = 1,
    PYCollectionViewRefreshTypeHeader,
    PYCollectionViewRefreshTypeFooter,
    PYCollectionViewRefreshTypeHeaderAndFooter
};

@interface PYBaseCollectionView : UICollectionView

@property (nonatomic, copy)  void(^headRefreshBlock)();
@property (nonatomic, copy)  void(^footRefreshBlock)();

@property (nonatomic, assign) BOOL isShowBlankView;
@property (nonatomic, assign) BOOL hasMore;

- (void)setTableRefreshType:(PYCollectionViewRefreshType)refreshType;


@end
