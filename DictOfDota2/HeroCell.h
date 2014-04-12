//
//  HeroCell.h
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *HeroImage;
@property (weak, nonatomic) IBOutlet UILabel *HeroName;

@end
