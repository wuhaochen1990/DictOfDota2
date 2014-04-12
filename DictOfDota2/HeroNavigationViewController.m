//
//  HeroNavigationViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "HeroNavigationViewController.h"
#import "HeroCell.h"
#include "HeroCategory.h"
@interface HeroNavigationViewController ()
{
    NSArray *strHeroImage;
    NSArray *agiHeroImage;
    NSArray *intHeroImage;
}

@end

@implementation HeroNavigationViewController

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
    
    
}
//collection data set
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [strHeroImage count];
            break;
        case 1:
            return [strHeroImage count];
            break;
        case 2:
            return [strHeroImage count];
            break;
        default:
            break;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCell *hero = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeroID" forIndexPath:indexPath];
    if (indexPath.section == 1) {
        [[hero HeroImage]setImage:[UIImage imageNamed:[strHeroImage objectAtIndex:indexPath.item]]];
    }
    switch (indexPath.section) {
        case 0:
            [[hero HeroImage]setImage:[UIImage imageNamed:[strHeroImage objectAtIndex:indexPath.item]]];
            break;
        case 1:
            [[hero HeroImage]setImage:[UIImage imageNamed:[strHeroImage objectAtIndex:indexPath.item]]];
            break;
        case 2:
            [[hero HeroImage]setImage:[UIImage imageNamed:[strHeroImage objectAtIndex:indexPath.item]]];
            break;
        default:
            break;
    }
    
    return hero;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeroCategory *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeroHeader" forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            header.HeroCategoryLabel.text = @"Strength Hero";
            break;
        case 1:
            header.HeroCategoryLabel.text = @"Agility Hero";
            break;
        case 2:
            header.HeroCategoryLabel.text = @"Intelligence Hero";
            break;
        default:
            break;
    }
    return header;
}


//end of collection data set

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
