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

- (IBAction)ProducerInfo:(id)sender {
    UIAlertView *producerInfo;
    NSString *myWord = [[NSString alloc]initWithFormat:@"感谢您对本软件的支持，我是软件制作者Timmy。这是一个帮助中国人掌握Dota2英文词汇和用法的软件。希望你能从中收获知识，顺畅地用英语与外国人在Dota2中交流。"];
    producerInfo = [[UIAlertView alloc]initWithTitle:@"Producer Information" message:myWord
                                            delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
    [producerInfo show];
    
    
}
@end
