//
//  HeroInfoViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "HeroInfoViewController.h"


@interface HeroInfoViewController ()

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
    // set title
    NSArray *s;
    NSString *n = @"";
    if ([self.heroName rangeOfString:@"_"].location == NSNotFound) {
        NSLog(@"hello");
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
    //
    
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
    
    NSURL *audioURL = [NSURL fileURLWithPath:
                       [[NSBundle mainBundle]
                        pathForResource:[self.heroName stringByAppendingString:@"Audio"]
                        ofType:@"mp3"]];
    heroAudio = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:nil];
    [heroAudio play];
    
}
@end
