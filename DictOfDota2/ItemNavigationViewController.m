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
                  @"band of elvenskin",
                  @"boots of speed",
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
                  @"flying courier",
                  @"gauntlets of strength",
                  @"gem",
                  @"ghost",
                  @"gloves of haste",
                  @"healing salve",
                  @"helm of iron vwill",
                  @"javelin",
                  @"lifesteal",
                  @"magic stick",
                  @"mantle of intelligence",
                  @"mithril hammer",
                  @"observer ward",
                  @"ogre axe",
                  @"platemail",
                  @"quarterstaff",
                  @"quelling blade",
                  @"ring of protection",
                  @"ring of regen",
                  @"robe of magi",
                  @"sage's mask",
                  @"sentry ward",
                  @"shadow amulet",
                  @"slippers of agility",
                  @"smoke of deceit",
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
        @"blades of attack": [NSString stringWithFormat:@"大剑"],
        @"blink dagger": [NSString stringWithFormat:@"闪烁匕首"],
        @"band of elvenskin": [NSString stringWithFormat:@"精灵布带"],
        @"boots of speed": [NSString stringWithFormat:@"速度之靴"],
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
        @"healing salve": [NSString stringWithFormat:@"治疗药膏"],
        @"flying courier": [NSString stringWithFormat:@"飞行信使"],
        @"gauntlets of strength": [NSString stringWithFormat:@"力量手套"],
        @"gem": [NSString stringWithFormat:@"真视宝石"],
        @"ghost": [NSString stringWithFormat:@"幽魂权杖"],
        @"gloves of haste": [NSString stringWithFormat:@"加速手套"],
        @"helm of iron vwill": [NSString stringWithFormat:@"铁意头盔"],
        @"javelin": [NSString stringWithFormat:@"标枪"],
        @"lifesteal": [NSString stringWithFormat:@"吸血面具"],
        @"magic stick": [NSString stringWithFormat:@"魔棒"],
        @"mantle of intelligence": [NSString stringWithFormat:@"智力斗篷"],
        @"mithril hammer": [NSString stringWithFormat:@"秘银锤"],
        @"observer ward": [NSString stringWithFormat:@"侦查守卫"],
        @"ogre axe": [NSString stringWithFormat:@"食人魔之斧"],
        @"platemail": [NSString stringWithFormat:@"板甲"],
        @"quarterstaff": [NSString stringWithFormat:@"短棍"],
        @"quelling blade": [NSString stringWithFormat:@"压制之刃"],
        @"ring of protection": [NSString stringWithFormat:@"守护指环"],
        @"ring of regen": [NSString stringWithFormat:@"回复戒指"],
        @"robe of magi": [NSString stringWithFormat:@"法师长袍"],
        @"sentry ward": [NSString stringWithFormat:@"岗哨守卫"],
        @"shadow amulet": [NSString stringWithFormat:@"暗影护符"],
        @"slippers of agility": [NSString stringWithFormat:@"敏捷便鞋"],
        @"smoke of deceit": [NSString stringWithFormat:@"诡计之雾"],
        @"sage's mask": [NSString stringWithFormat:@"贤者面罩"],
        @"staff of wizardry": [NSString stringWithFormat:@"魔力法杖"],
        @"stout shield": [NSString stringWithFormat:@"圆盾"],
        @"talisman of evasion": [NSString stringWithFormat:@"闪避护符"],
        @"tango": [NSString stringWithFormat:@"树之祭祀"],
        @"tpscroll": [NSString stringWithFormat:@"回城卷轴"],
        @"ultimate orb": [NSString stringWithFormat:@"极限法球"],

    };
    upgradesItemChinese = @{
        @"abyssal blade": [NSString stringWithFormat:@"深渊之刃"],
        @"aghanim's scepter": [NSString stringWithFormat:@"阿哈利姆神杖"],
        @"arcane boots": [NSString stringWithFormat:@"奥术鞋"],
        @"armlet of mordiggian": [NSString stringWithFormat:@"莫尔迪基安的臂章"],
        @"assault cuirass": [NSString stringWithFormat:@"强袭胸甲"],
        @"battle fury": [NSString stringWithFormat:@"狂战斧"],
        @"black king bar": [NSString stringWithFormat:@"黑皇杖"],
        @"blade mail": [NSString stringWithFormat:@"刃甲"],
        @"bloodstone": [NSString stringWithFormat:@"血精石"],
        @"bracer": [NSString stringWithFormat:@"护腕"],
        @"buckler": [NSString stringWithFormat:@"玄冥盾牌"],
        @"butterfly": [NSString stringWithFormat:@"蝴蝶"],
        @"crystalys": [NSString stringWithFormat:@"水晶剑"],
        @"daedalus": [NSString stringWithFormat:@"代达罗斯之殇"],
        @"dagon": [NSString stringWithFormat:@"达贡之神力"],
        @"desolator": [NSString stringWithFormat:@"黯灭"],
        @"diffusal blade": [NSString stringWithFormat:@"净魂之刃"],
        @"divine rapier": [NSString stringWithFormat:@"圣剑"],
        @"drum of endurance": [NSString stringWithFormat:@"韧鼓"],
        @"ethereal blade": [NSString stringWithFormat:@"虚灵之刃"],
        @"eul's scepter of divinity": [NSString stringWithFormat:@"EUL的神圣法杖"],
        @"eye of Skadi": [NSString stringWithFormat:@"斯嘉蒂之眼"],
        @"force staff": [NSString stringWithFormat:@"原力法杖"],
        @"hand of midas": [NSString stringWithFormat:@"迈达斯之手"],
        @"headdress": [NSString stringWithFormat:@"恢复头巾"],
        @"heart of Tarrasque": [NSString stringWithFormat:@"恐鳌之心"],
        @"heaven's halberd": [NSString stringWithFormat:@"天堂之戟"],
        @"helm of the dominator": [NSString stringWithFormat:@"支配头盔"],
        @"hood of defiance": [NSString stringWithFormat:@"挑战头巾"],
        @"Linken's sphere": [NSString stringWithFormat:@"林肯法球"],
        @"maelstrom": [NSString stringWithFormat:@"漩涡"],
        @"magic wand": [NSString stringWithFormat:@"魔杖"],
        @"manta style": [NSString stringWithFormat:@"幻影斧"],
        @"mask of madness": [NSString stringWithFormat:@"疯狂面具"],
        @"medallion of courage": [NSString stringWithFormat:@"勇气勋章"],
        @"mekansm": [NSString stringWithFormat:@"梅肯斯姆"],
        @"mjollnir": [NSString stringWithFormat:@"雷神之锤"],
        @"monkey king bar": [NSString stringWithFormat:@"金箍棒"],
        @"necronomicon": [NSString stringWithFormat:@"死灵书"],
        @"null talisman": [NSString stringWithFormat:@"空灵挂件"],
        @"oblivion staff": [NSString stringWithFormat:@"空明杖"],
        @"orchid malevolence": [NSString stringWithFormat:@"紫怨"],
        @"perseverance": [NSString stringWithFormat:@"坚韧球"],
        @"phase boots": [NSString stringWithFormat:@"相位鞋"],
        @"pipe of insight": [NSString stringWithFormat:@"洞察烟斗"],
        @"poor mans shield": [NSString stringWithFormat:@"穷鬼盾"],
        @"power treads": [NSString stringWithFormat:@"动力鞋"],
        @"radiance": [NSString stringWithFormat:@"辉耀"],
        @"refresher orb": [NSString stringWithFormat:@"刷新球"],
        @"ring of aquila": [NSString stringWithFormat:@"天鹰之戒"],
        @"ring of basilius": [NSString stringWithFormat:@"王者之戒"],
        @"rod of atos": [NSString stringWithFormat:@"阿托斯之棍"],
        @"sange and yasha": [NSString stringWithFormat:@"散夜对剑"],
        @"sange": [NSString stringWithFormat:@"散华"],
        @"satanic": [NSString stringWithFormat:@"撒旦之邪力"],
        @"scythe of vyse": [NSString stringWithFormat:@"邪恶镰刀"],
        @"shadow blade": [NSString stringWithFormat:@"影刃"],
        @"shiva's guard": [NSString stringWithFormat:@"希瓦的守护"],
        @"skull basher": [NSString stringWithFormat:@"碎颅锤"],
        @"soul booster": [NSString stringWithFormat:@"振魂石"],
        @"soul ring": [NSString stringWithFormat:@"灵魂之戒"],
        @"tranquil boots": [NSString stringWithFormat:@"静谧之鞋"],
        @"travel boots": [NSString stringWithFormat:@"远行鞋"],
        @"urn of shadows": [NSString stringWithFormat:@"影之灵龛"],
        @"vanguard": [NSString stringWithFormat:@"先锋盾"],
        @"veil of discord": [NSString stringWithFormat:@"纷争面纱"],
        @"vladmir's offering": [NSString stringWithFormat:@"弗拉迪米尔的祭品"],
        @"wraith band": [NSString stringWithFormat:@"怨灵系带"],
        @"yasha": [NSString stringWithFormat:@"夜叉"],
    };
    secretItemChinese = @{
        @"demon edge": [NSString stringWithFormat:@"恶魔刀锋"],
        @"eaglesong": [NSString stringWithFormat:@"鹰歌弓"],
        @"energy booster": [NSString stringWithFormat:@"能量之球"],
        @"hyperstone": [NSString stringWithFormat:@"振奋宝石"],
        @"mystic staff": [NSString stringWithFormat:@"神秘法杖"],
        @"orb of venom": [NSString stringWithFormat:@"淬毒之珠"],
        @"point booster": [NSString stringWithFormat:@"精气之球"],
        @"reaver": [NSString stringWithFormat:@"掠夺者之斧"],
        @"ring of health": [NSString stringWithFormat:@"治疗指环"],
        @"sacred relic": [NSString stringWithFormat:@"圣者遗物"],
        @"vitality booster": [NSString stringWithFormat:@"活力之球"],
        @"void stone": [NSString stringWithFormat:@"虚无宝石"],
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
    NSString *itemName;
    switch (indexPath.section) {
        case 0:
            itemName = [basicsItem objectAtIndex:indexPath.item];
            itemDescription = [[UIAlertView alloc]initWithTitle:itemName message:[basicsItemChinese objectForKey:itemName] delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
            break;
        case 1:
            itemName = [upgradesItem objectAtIndex:indexPath.item];
            itemDescription = [[UIAlertView alloc]initWithTitle:itemName message:[upgradesItemChinese objectForKey:itemName] delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
            break;
        case 2:
            itemName = [secretItem objectAtIndex:indexPath.item];
            itemDescription = [[UIAlertView alloc]initWithTitle:itemName message:[secretItemChinese objectForKey:itemName] delegate:nil cancelButtonTitle:@"Back" otherButtonTitles:nil, nil];
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
