//
//  PYRefreshHeader.h
//  Pods
//
//  Created by yunhe.lin on 16/7/28.
//
//

#import <MJRefresh/MJRefresh.h>

@interface PYRefreshHeader : MJRefreshHeader

+ (instancetype)py_headerWithRefreshingTarget:(id)target refreshingAction:(SEL)action;

@end
