//
//  AbilityTableViewCell.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/14/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "AbilityTableViewCell.h"

@implementation AbilityTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
