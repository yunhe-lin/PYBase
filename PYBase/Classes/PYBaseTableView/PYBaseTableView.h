//
//  PYBaseTableView.h
//  Pods
//
//  Created by yunhe.lin on 16/7/27.
//
//

#import <UIKit/UIKit.h>

@class PYBaseTableView;

typedef NS_ENUM(NSInteger, PYTableViewRefreshType) {
    PYTableViewRefreshTypeNone = 1,
    PYTableViewRefreshTypeHeader,
    PYTableViewRefreshTypeFooter,
    PYTableViewRefreshTypeHeaderAndFooter
};

@protocol PYTableViewDelegate <NSObject>


@end

@interface PYBaseTableView : UITableView

@property (nonatomic, copy)  void(^headRefreshBlock)();
@property (nonatomic, copy)  void(^footRefreshBlock)();

@property (nonatomic, assign) BOOL isShowBlankView;
@property (nonatomic, assign) BOOL hasMore;

- (void)setTableRefreshType:(PYTableViewRefreshType)refreshType;

@end
