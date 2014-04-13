//
//  HeroInfoViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "HeroInfoViewController.h"


@interface HeroInfoViewController ()
{
    NSString *audioname;
    NSDictionary *descriptionDict;
    NSDictionary *detailDict;
}

@end

@implementation HeroInfoViewController
@synthesize heroName;
AVAudioPlayer *heroAudio;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set audio name
    audioname = self.heroName;
    // set title
    NSArray *s;
    NSString *n = @"";
    if ([self.heroName rangeOfString:@"_"].location == NSNotFound) {
        self.title = self.heroName;
    }else{
        NSLog(@"hello2");
        s=[self.heroName componentsSeparatedByString:@"_"];
        
        for (id name in s) {
            n = [n stringByAppendingString:name];
            n = [n stringByAppendingString:@" "];
        }
        self.title = n;
    }
    //end of set title
    NSLog(@"end of title");
    //set the hero image
    [self.HeroImage setImage:[UIImage imageNamed:[heroName stringByAppendingString:@".png"]]];
    //set the description
    descriptionDict = @{
                        @"Abaddon": [NSString stringWithFormat:@"亚巴顿"],
                        @"Alchemist": [NSString stringWithFormat:@"炼金术士"],
                        @"Axe": [NSString stringWithFormat:@"斧王"],
                        @"Beastmaster": [NSString stringWithFormat:@"兽王"],
                        @"Brewmaster": [NSString stringWithFormat:@"熊猫酒仙"],
                        @"Bristleback": [NSString stringWithFormat:@"刚背兽"],
                        @"Centaur": [NSString stringWithFormat:@"半人马酋长"],
                        @"Chaos_Knight": [NSString stringWithFormat:@"混沌骑士"],
                        };
    [[self HeroDescription]setText:descriptionDict[self.heroName]];
    //set the heroDetail
    detailDict = @{
                   @"Abaddon": [NSString stringWithFormat:@"Abaddon源于圣经启示录代表地狱的恶魔"],
                   @"Alchemist": [NSString stringWithFormat:@"炼金术士"],
                   @"Axe": [NSString stringWithFormat:@"斧王"],
                   @"Beastmaster": [NSString stringWithFormat:@"兽王"],
                   @"Brewmaster": [NSString stringWithFormat:@"熊猫酒仙"],
                   @"Bristleback": [NSString stringWithFormat:@"刚背兽"],
                   @"Centaur": [NSString stringWithFormat:@"半人马酋长"],
                   @"Chaos_Knight": [NSString stringWithFormat:@"混沌骑士"],
                        };
    [[self HeroDetail]setText:detailDict[self.heroName]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // 
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)PlayAudio:(UIButton *)sender {
    NSLog(@"hello audio");
    
    //NSString *s = [NSString stringWithFormat:self.heroName];
    NSURL *audioURL = [NSURL fileURLWithPath:
                       [[NSBundle mainBundle]
                        pathForResource:[audioname stringByAppendingString:@"Audio"]
                        ofType:@"mp3"]];
    heroAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    [heroAudio play];
    
}
@end
