//
//  PYBaseCollectionViewCell.h
//  Pods
//
//  Created by yunhe.lin on 16/7/31.
//
//

#import <UIKit/UIKit.h>

@interface PYBaseCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) id cellData;

- (void)initCellUI;

- (void)refreshCollectionViewCell:(id)cellData;

@end
