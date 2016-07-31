//
//  PYBaseCollectionViewCell.m
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import "PYBaseCollectionViewCell.h"

@implementation PYBaseCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initCellUI];
    }
    return self;
}

- (void)initCellUI{};

- (void)refreshCollectionViewCell:(id)cellData
{
    self.cellData = cellData;
}

@end
