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
    basicsItem = [[NSArray alloc] initWithObjects:
                  @"belt of strength",
                  @"blade of alacrity",
                  @"blades of attack",
                  @"blink dagger",
                  @"boots of elves",
                  @"boots",
                  @"bottle",
                  @"branches",
                  @"broadsword",
                  @"chainmail",
                  @"circlet",
                  @"clarity",
                  @"claymore",
                  @"cloak",
                  @"courier",
                  @"dust",
                  @"flask",
                  @"flying courier",
                  @"gauntlets",
                  @"gem",
                  @"ghost",
                  @"gloves",
                  @"helm of iron vwill",
                  @"javelin",
                  @"lifesteal",
                  @"magic_stick",
                  @"mantle",
                  @"mithril hammer",
                  @"observer ward",
                  @"ogre axe",
                  @"platemail",
                  @"quarterstaff",
                  @"quelling blade",
                  @"ring of protection",
                  @"ring of regen",
                  @"robe",
                  @"sentry ward",
                  @"shadow amulet",
                  @"slippers",
                  @"smoke of deceit",
                  @"sobi mask",
                  @"staff of wizardry",
                  @"stout shield",
                  @"talisman of evasion",
                  @"tango",
                  @"tpscroll",
                  @"ultimate orb",nil];
    upgradesItem = [[NSArray alloc] initWithObjects:
                    @"abyssal blade",
                    @"aghanim's scepter",
                    @"arcane boots",
                    @"armlet of mordiggian",
                    @"assault cuirass",
                    @"battle fury",
                    @"black king bar",
                    @"blade mail",
                    @"bloodstone",
                    @"bracer",
                    @"buckler",
                    @"butterfly",
                    @"crystalys",
                    @"daedalus",
                    @"dagon",
                    @"desolator",
                    @"diffusal blade",
                    @"divine rapier",
                    @"drum of endurance",
                    @"ethereal blade",
                    @"eul's scepter of divinity",
                    @"eye of Skadi",
                    @"force staff",
                    @"hand of midas",
                    @"headdress",
                    @"heart of Tarrasque",
                    @"heaven's halberd",
                    @"helm of the dominator",
                    @"hood of defiance",
                    @"Linken's sphere",
                    @"maelstrom",
                    @"magic wand",
                    @"manta style",
                    @"mask of madness",
                    @"medallion of courage",
                    @"mekansm",
                    @"mjollnir",
                    @"monkey king bar",
                    @"necronomicon",
                    @"null talisman",
                    @"oblivion staff",
                    @"orchid malevolence",
                    @"perseverance",
                    @"phase boots",
                    @"pipe of insight",
                    @"poor mans shield",
                    @"power treads",
                    @"radiance",
                    @"refresher orb",
                    @"ring of aquila",
                    @"ring of basilius",
                    @"rod of atos",
                    @"sange and yasha",
                    @"sange",
                    @"satanic",
                    @"scythe of vyse",
                    @"shadow blade",
                    @"shiva's guard",
                    @"skull basher",
                    @"soul booster",
                    @"soul ring",
                    @"tranquil boots",
                    @"travel boots",
                    @"urn of shadows",
                    @"vanguard",
                    @"veil of discord",
                    @"vladmir's offering",
                    @"wraith band",
                    @"yasha",nil];
    secretItem = [[NSArray alloc] initWithObjects:
                  @"demon edge",
                  @"eaglesong",
                  @"energy booster",
                  @"hyperstone",
                  @"mystic staff",
                  @"orb of venom",
                  @"point booster",
                  @"reaver",
                  @"ring of health",
                  @"sacred relic",
                  @"vitality booster",
                  @"void stone",nil];


    
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
            itemName = [upgradesItem objectAtIndex:indexPath.item];
            itemImage = [itemName stringByAppendingString:@".png"];
            [item.itemName setText:itemName];
            [item.itemImage setImage:[UIImage imageNamed:itemImage]];
            break;
        case 2:
            itemName = [secretItem objectAtIndex:indexPath.item];
            itemImage = [itemName stringByAppendingString:@".png"];
            [item.itemName setText:itemName];
            [item.itemImage setImage:[UIImage imageNamed:itemImage]];
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
