//
//  PYRefreshManager.h
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PYRefreshHeaderType) {
    PYRefreshHeaderTypeNormal = 1
};

typedef NS_ENUM(NSInteger, PYRefreshFooterType) {
    PYRefreshFooterTypeNormal = 1
};

@interface PYRefreshManager : NSObject

/*!
 *  获取
 *
 *  @param target 方法target
 *  @param sel    方法
 *
 *  @return header
 */
+ (id)py_headerRefresh:(id)target action:(SEL)sel refreshType:(PYRefreshHeaderType)type;

/*!
 *  获取尾部刷新控件
 *
 *  @param target
 *  @param sel
 *  @param type
 *
 *  @return
 */
+ (id)py_footerRefresh:(id)target action:(SEL)sel refreshType:(PYRefreshFooterType)type;

@end
