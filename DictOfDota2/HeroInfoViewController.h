//
//  HeroInfoViewController.h
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface HeroInfoViewController : UIViewController
@property (weak, nonatomic) NSString *heroName;
@property (weak, nonatomic) IBOutlet UIImageView *HeroImage;
@property (weak, nonatomic) IBOutlet UITableView *AbilityTable;
@property (weak, nonatomic) IBOutlet UILabel *HeroDescription;
@property (weak, nonatomic) IBOutlet UILabel *HeroDetail;
- (IBAction)PlayAudio:(UIButton *)sender;

@end
