//
//  PYBaseTableViewCell.m
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import "PYBaseTableViewCell.h"

@interface PYBaseTableViewCell()


@end

@implementation PYBaseTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self initCellUI];
    }
    return self;
}

- (void)initCellUI
{
    
}

- (void)refreshCellByCellData:(id)cellData
{
    self.cellData = cellData;
}

@end
