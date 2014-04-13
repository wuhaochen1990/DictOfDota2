//
//  HeroNavigationViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "HeroNavigationViewController.h"
#import "HeroCell.h"
#import "HeroCategory.h"
#import "HeroInfoViewController.h"
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
    //import hero image
    
    NSFileManager *fileManager;
    fileManager = [NSFileManager defaultManager];
    strHeroImage = [fileManager contentsOfDirectoryAtPath:@"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/strength" error:nil];
    agiHeroImage = [fileManager contentsOfDirectoryAtPath:@"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/agility" error:nil];
    intHeroImage = [fileManager contentsOfDirectoryAtPath:@"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/intelligence" error:nil];
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
            return [agiHeroImage count];
            break;
        case 2:
            return [intHeroImage count];
            break;
        default:
            break;
    }
    return 0;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCell *hero = [collectionView dequeueReusableCellWithReuseIdentifier:@"HeroID" forIndexPath:indexPath];
    NSArray *s;
    NSString *heroname;
    switch (indexPath.section) {
        case 0:
            [[hero HeroImage]setImage:[UIImage imageNamed:[strHeroImage objectAtIndex:indexPath.item]]];
            //NSLog([strHeroImage objectAtIndex:indexPath.item]);
            s = [[strHeroImage objectAtIndex:indexPath.item] componentsSeparatedByString:@"."];
            heroname = [s objectAtIndex:0];
            [hero HeroName].text = heroname;
            break;
        case 1:
            [[hero HeroImage]setImage:[UIImage imageNamed:[agiHeroImage objectAtIndex:indexPath.item]]];
            s = [[agiHeroImage objectAtIndex:indexPath.item] componentsSeparatedByString:@"."];
            heroname = [s objectAtIndex:0];
            [hero HeroName].text = heroname;
            break;
        case 2:
            [[hero HeroImage]setImage:[UIImage imageNamed:[intHeroImage objectAtIndex:indexPath.item]]];
            s = [[intHeroImage objectAtIndex:indexPath.item] componentsSeparatedByString:@"."];
            heroname = [s objectAtIndex:0];
            [hero HeroName].text = heroname;
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
//prepare for the segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue");
    if ([[segue identifier] isEqualToString:@"goToHeroInfo"]) {
        NSIndexPath *indexPath = [self.HeroCollection indexPathForCell:sender];
        
        NSArray *s;
        NSString *heroname;
        HeroInfoViewController *heroInfoVC;
        
        switch (indexPath.section) {
            case 0:
                s = [[strHeroImage objectAtIndex:indexPath.item] componentsSeparatedByString:@"."];
                heroname = [s objectAtIndex:0];
                heroInfoVC = [segue destinationViewController];
                heroInfoVC.heroName = heroname;
                //NSLog(heroname);
                break;
            case 1:
                s = [[agiHeroImage objectAtIndex:indexPath.item] componentsSeparatedByString:@"."];
                heroname = [s objectAtIndex:0];
                heroInfoVC = [segue destinationViewController];
                heroInfoVC.heroName = heroname;
                break;
            case 2:
                s = [[intHeroImage objectAtIndex:indexPath.item] componentsSeparatedByString:@"."];
                heroname = [s objectAtIndex:0];
                heroInfoVC = [segue destinationViewController];
                heroInfoVC.heroName = heroname;
                break;
            default:
                break;
        }
    }
}

//end of segue
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
