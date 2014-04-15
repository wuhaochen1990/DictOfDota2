//
//  MainNavigationViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/14/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "MainNavigationViewController.h"

@interface MainNavigationViewController ()

@end

@implementation MainNavigationViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//pragma mark - Navigation
-(void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [banner setAlpha:1];
    [UIView commitAnimations];
    
}
-(void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

@end
