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
    NSDictionary *basicsItemChinese;
    NSDictionary *upgradesItemChinese;
    NSDictionary *secretItemChinese;
    
    
    
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
                  @"magic stick",
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
    //set the chinese name of the items
    basicsItemChinese = @{
        @"belt of strength": [NSString stringWithFormat:@"力量腰带"],
        @"blade of alacrity": [NSString stringWithFormat:@"欢欣之刃"],
        @"blades of attack": [NSString stringWithFormat:@""],
        @"blink dagger": [NSString stringWithFormat:@""],
        @"boots of elves": [NSString stringWithFormat:@"闪烁匕首"],
        @"boots": [NSString stringWithFormat:@"速度之靴"],
        @"bottle": [NSString stringWithFormat:@"魔瓶"],
        @"branches": [NSString stringWithFormat:@"铁树枝干"],
        @"broadsword": [NSString stringWithFormat:@"阔剑"],
        @"chainmail": [NSString stringWithFormat:@"锁子甲"],
        @"circlet": [NSString stringWithFormat:@"圆环"],
        @"clarity": [NSString stringWithFormat:@"净化药水"],
        @"claymore": [NSString stringWithFormat:@""],
        @"cloak": [NSString stringWithFormat:@"抗魔斗篷"],
        @"courier": [NSString stringWithFormat:@"动物信使"],
        @"dust": [NSString stringWithFormat:@"显影之尘"],
        @"flask": [NSString stringWithFormat:@""],
        @"flying courier": [NSString stringWithFormat:@"飞行信使"],
        @"gauntlets": [NSString stringWithFormat:@""],
        @"gem": [NSString stringWithFormat:@"真视宝石"],
        @"ghost": [NSString stringWithFormat:@"幽魂权杖"],
        @"gloves": [NSString stringWithFormat:@"加速手套"],
        @"helm of iron vwill": [NSString stringWithFormat:@"铁意头盔"],
        @"javelin": [NSString stringWithFormat:@""],
        @"lifesteal": [NSString stringWithFormat:@"吸血面具"],
        @"magic stick": [NSString stringWithFormat:@"魔棒"],
        @"mantle": [NSString stringWithFormat:@""],
        @"mithril hammer": [NSString stringWithFormat:@"秘银锤"],
        @"observer ward": [NSString stringWithFormat:@"侦查守卫"],
        @"ogre axe": [NSString stringWithFormat:@"食人魔之斧"],
        @"platemail": [NSString stringWithFormat:@"板甲"],
        @"quarterstaff": [NSString stringWithFormat:@""],
        @"quelling blade": [NSString stringWithFormat:@"压制之刃"],
        @"ring of protection": [NSString stringWithFormat:@"守护指环"],
        @"ring of regen": [NSString stringWithFormat:@""],
        @"robe": [NSString stringWithFormat:@""],
        @"sentry ward": [NSString stringWithFormat:@""],
        @"shadow amulet": [NSString stringWithFormat:@""],
        @"slippers": [NSString stringWithFormat:@""],
        @"smoke of deceit": [NSString stringWithFormat:@""],
        @"sobi mask": [NSString stringWithFormat:@""],
        @"staff of wizardry": [NSString stringWithFormat:@""],
        @"stout shield": [NSString stringWithFormat:@""],
        @"talisman of evasion": [NSString stringWithFormat:@""],
        @"tango": [NSString stringWithFormat:@"树之祭祀"],
        @"tpscroll": [NSString stringWithFormat:@""],
        @"ultimate orb": [NSString stringWithFormat:@""],

    };
    upgradesItemChinese = @{
        @"abyssal blade": [NSString stringWithFormat:@""],
        @"aghanim's scepter": [NSString stringWithFormat:@""],
        @"arcane boots": [NSString stringWithFormat:@""],
        @"armlet of mordiggian": [NSString stringWithFormat:@""],
        @"assault cuirass": [NSString stringWithFormat:@""],
        @"battle fury": [NSString stringWithFormat:@""],
        @"black king bar": [NSString stringWithFormat:@""],
        @"blade mail": [NSString stringWithFormat:@""],
        @"bloodstone": [NSString stringWithFormat:@""],
        @"bracer": [NSString stringWithFormat:@""],
        @"buckler": [NSString stringWithFormat:@""],
        @"butterfly": [NSString stringWithFormat:@""],
        @"crystalys": [NSString stringWithFormat:@""],
        @"daedalus": [NSString stringWithFormat:@""],
        @"dagon": [NSString stringWithFormat:@""],
        @"desolator": [NSString stringWithFormat:@""],
        @"diffusal blade": [NSString stringWithFormat:@""],
        @"divine rapier": [NSString stringWithFormat:@""],
        @"drum of endurance": [NSString stringWithFormat:@""],
        @"ethereal blade": [NSString stringWithFormat:@""],
        @"eul's scepter of divinity": [NSString stringWithFormat:@""],
        @"eye of Skadi": [NSString stringWithFormat:@""],
        @"force staff": [NSString stringWithFormat:@""],
        @"hand of midas": [NSString stringWithFormat:@""],
        @"headdress": [NSString stringWithFormat:@""],
        @"heart of Tarrasque": [NSString stringWithFormat:@""],
        @"heaven's halberd": [NSString stringWithFormat:@""],
        @"helm of the dominator": [NSString stringWithFormat:@""],
        @"hood of defiance": [NSString stringWithFormat:@""],
        @"Linken's sphere": [NSString stringWithFormat:@""],
        @"maelstrom": [NSString stringWithFormat:@""],
        @"magic wand": [NSString stringWithFormat:@""],
        @"manta style": [NSString stringWithFormat:@""],
        @"mask of madness": [NSString stringWithFormat:@""],
        @"medallion of courage": [NSString stringWithFormat:@""],
        @"mekansm": [NSString stringWithFormat:@""],
        @"mjollnir": [NSString stringWithFormat:@""],
        @"monkey king bar": [NSString stringWithFormat:@""],
        @"necronomicon": [NSString stringWithFormat:@""],
        @"null talisman": [NSString stringWithFormat:@""],
        @"oblivion staff": [NSString stringWithFormat:@""],
        @"orchid malevolence": [NSString stringWithFormat:@""],
        @"perseverance": [NSString stringWithFormat:@""],
        @"phase boots": [NSString stringWithFormat:@""],
        @"pipe of insight": [NSString stringWithFormat:@""],
        @"poor mans shield": [NSString stringWithFormat:@""],
        @"power treads": [NSString stringWithFormat:@""],
        @"radiance": [NSString stringWithFormat:@""],
        @"refresher orb": [NSString stringWithFormat:@""],
        @"ring of aquila": [NSString stringWithFormat:@""],
        @"ring of basilius": [NSString stringWithFormat:@""],
        @"rod of atos": [NSString stringWithFormat:@""],
        @"sange and yasha": [NSString stringWithFormat:@""],
        @"sange": [NSString stringWithFormat:@""],
        @"satanic": [NSString stringWithFormat:@""],
        @"scythe of vyse": [NSString stringWithFormat:@""],
        @"shadow blade": [NSString stringWithFormat:@""],
        @"shiva's guard": [NSString stringWithFormat:@""],
        @"skull basher": [NSString stringWithFormat:@""],
        @"soul booster": [NSString stringWithFormat:@""],
        @"soul ring": [NSString stringWithFormat:@""],
        @"tranquil boots": [NSString stringWithFormat:@""],
        @"travel boots": [NSString stringWithFormat:@""],
        @"urn of shadows": [NSString stringWithFormat:@""],
        @"vanguard": [NSString stringWithFormat:@""],
        @"veil of discord": [NSString stringWithFormat:@""],
        @"vladmir's offering": [NSString stringWithFormat:@""],
        @"wraith band": [NSString stringWithFormat:@""],
        @"yasha": [NSString stringWithFormat:@""],
    };
    secretItemChinese = @{
        @"demon edge": [NSString stringWithFormat:@""],
        @"eaglesong": [NSString stringWithFormat:@""],
        @"energy booster": [NSString stringWithFormat:@""],
        @"hyperstone": [NSString stringWithFormat:@""],
        @"mystic staff": [NSString stringWithFormat:@""],
        @"orb of venom": [NSString stringWithFormat:@""],
        @"point booster": [NSString stringWithFormat:@""],
        @"reaver": [NSString stringWithFormat:@""],
        @"ring of health": [NSString stringWithFormat:@""],
        @"sacred relic": [NSString stringWithFormat:@""],
        @"vitality booster": [NSString stringWithFormat:@""],
        @"void stone": [NSString stringWithFormat:@""],
    };
    
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

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *itemDescription;
    switch (indexPath.section) {
        case 0:
            itemDescription = [[UIAlertView alloc]initWithTitle:@"hello" message:@"hello" delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        default:
            break;
    }
    [itemDescription show];
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
