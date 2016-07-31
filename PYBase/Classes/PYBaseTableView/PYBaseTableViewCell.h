//
//  PYBaseTableViewCell.h
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import <UIKit/UIKit.h>

@interface PYBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) id cellData; // celldata cell 所需要的数据

/*!
 *  更新cell 数据源
 *
 *  @param cellData 数据源
 */
- (void)refreshCellByCellData:(id)cellData;

/*!
 *  cell 初始化界面使用
 */
- (void)initCellUI;


@end
