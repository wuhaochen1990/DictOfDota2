//
//  AbilityTableViewCell.h
//  DictOfDota2
//
//  Created by Haochen Wu on 4/14/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AbilityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *AbilityImage;
@property (weak, nonatomic) IBOutlet UILabel *AbilityName;
@property (weak, nonatomic) IBOutlet UILabel *AbilityDetail;

@end
