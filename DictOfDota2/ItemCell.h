//
//  ItemCell.h
//  DictOfDota2
//
//  Created by Haochen Wu on 5/3/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemName;

@end
