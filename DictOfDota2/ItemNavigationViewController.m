//
//  ItemNavigationViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 5/3/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "ItemNavigationViewController.h"
#import "ItemCategory.h"
#import "ItemCell.h"

@interface ItemNavigationViewController ()
{
    NSArray *basicsItem;
    NSArray *upgradesItem;
    NSArray *secretItem;
}

@end

@implementation ItemNavigationViewController

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
    //set the 3 item array
    basicsItem = [[NSArray alloc] initWithObjects: @"clarity", nil];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [basicsItem count];
            break;
        case 1:
            return [upgradesItem count];
            break;
        case 2:
            return [secretItem count];
            break;
        default:
            break;
    }
    return 0;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ItemCell *item = [collectionView dequeueReusableCellWithReuseIdentifier:@"ItemID" forIndexPath:indexPath];
    NSString *itemName;
    NSString *itemImage;
    
    
    switch (indexPath.section){
        case 0:
            itemName = [basicsItem objectAtIndex:indexPath.item];
            itemImage = [itemName stringByAppendingString:@".png"];
            [item.itemName setText:itemName];
            [item.itemImage setImage:[UIImage imageNamed:itemImage]];
            break;
        case 1:
            break;
        case 2:
            break;
        default:
            break;
    }
    [item.layer setCornerRadius:4.0f];
    return item;
}
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    ItemCategory *itemHeader = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ItemHeader" forIndexPath:indexPath];
    switch (indexPath.section) {
        case 0:
            itemHeader.itemCategoryLabel.text = @"Basics";
            break;
        case 1:
            itemHeader.itemCategoryLabel.text = @"Upgrades";
            break;
        case 2:
            itemHeader.itemCategoryLabel.text = @"Secret";
            break;
        default:
            break;
    }
    return itemHeader;
}


@end
