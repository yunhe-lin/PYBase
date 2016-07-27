//
//  PYBaseView.h
//  Pods
//
//  Created by yunhe.lin on 16/7/27.
//
//

#import <UIKit/UIKit.h>

@interface PYBaseView : UIView

/*!
 *  view 数据源
 */
@property (nonatomic, strong) id viewData;

/*!
 *  创建viewUI 方法
 */
- (void)initViewUI;

@end
