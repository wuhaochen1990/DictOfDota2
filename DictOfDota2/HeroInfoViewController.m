//
//  HeroInfoViewController.m
//  DictOfDota2
//
//  Created by Haochen Wu on 4/12/14.
//  Copyright (c) 2014 Haochen Wu. All rights reserved.
//

#import "HeroInfoViewController.h"
#import "AbilityTableViewCell.h"


@interface HeroInfoViewController ()
{
    NSString *audioname;
    NSDictionary *descriptionDict;
    NSDictionary *detailDict;
    NSArray *abilityImage;
    NSMutableArray *abilityName;
    NSDictionary *abilityDetail;
    
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
                        @"Doom_Bringer": [NSString stringWithFormat:@"末日使者"],
                        @"Dragon_Knight": [NSString stringWithFormat:@"龙骑士"],
                        @"Earth_Spirit": [NSString stringWithFormat:@"大地之灵"],
                        @"Earthshaker": [NSString stringWithFormat:@"撼地者"],
                        @"Elder_Titan": [NSString stringWithFormat:@"上古巨神"],
                        @"Huskar": [NSString stringWithFormat:@"哈斯卡"],
                        @"Kunkka": [NSString stringWithFormat:@"昆卡"],
                        @"Legion_Commander": [NSString stringWithFormat:@"军团指挥官"],
                        @"Life_Stealer": [NSString stringWithFormat:@"噬魂鬼"],
                        @"Lycan": [NSString stringWithFormat:@"狼人"],
                        @"Magnus": [NSString stringWithFormat:@"马格纳斯"],
                        @"Night_Stalker": [NSString stringWithFormat:@"夜魔"],
                        @"Omniknight": [NSString stringWithFormat:@"全能骑士"],
                        @"Phoenix": [NSString stringWithFormat:@"凤凰"],
                        @"Pudge": [NSString stringWithFormat:@"帕吉"],
                        @"Rattletrap": [NSString stringWithFormat:@"发条地精"],
                        @"Sand_King": [NSString stringWithFormat:@"沙王"],
                        @"Timbersaw": [NSString stringWithFormat:@"伐木机"],
                        @"Skeleton_King": [NSString stringWithFormat:@"骷髅王"],
                        @"Slardar": [NSString stringWithFormat:@"斯拉达"],
                        @"Spirit_Breaker": [NSString stringWithFormat:@"裂魂人"],
                        @"Sven": [NSString stringWithFormat:@"斯温"],
                        @"Tidehunter": [NSString stringWithFormat:@"潮汐猎人"],
                        @"Tiny": [NSString stringWithFormat:@"小小"],
                        @"Treant": [NSString stringWithFormat:@"树精卫士"],
                        @"Tusk": [NSString stringWithFormat:@"巨牙海民"],
                        @"Undying": [NSString stringWithFormat:@"不朽尸王"],
                        @"Wisp": [NSString stringWithFormat:@"艾欧"],
                        @"Antimage": [NSString stringWithFormat:@"敌法师"],
                        @"Bloodseeker": [NSString stringWithFormat:@"血魔"],
                        @"Bounty_Hunter": [NSString stringWithFormat:@"赏金猎人"],
                        @"Broodmother": [NSString stringWithFormat:@"育母蜘蛛"],
                        @"Clinkz": [NSString stringWithFormat:@"克林克兹"],
                        @"Drow_Ranger": [NSString stringWithFormat:@"卓尔游侠"],
                        @"Ember_Spirit": [NSString stringWithFormat:@"灰烬之灵"],
                        @"Faceless_Void": [NSString stringWithFormat:@"虚空假面"],
                        @"Gyrocopter": [NSString stringWithFormat:@"矮人直升机"],
                        @"Juggernaut": [NSString stringWithFormat:@"主宰"],
                        @"Lone_Druid": [NSString stringWithFormat:@"德鲁伊"],
                        @"Luna": [NSString stringWithFormat:@"露娜"],
                        @"Medusa": [NSString stringWithFormat:@"美杜莎"],
                        @"Meepo": [NSString stringWithFormat:@"米波"],
                        @"Mirana": [NSString stringWithFormat:@"米拉娜"],
                        @"Morphling": [NSString stringWithFormat:@"变体精灵"],
                        @"Naga_Siren": [NSString stringWithFormat:@"娜迦海妖"],
                        @"Nevermore": [NSString stringWithFormat:@"影魔"],
                        @"Nyx_Assassin": [NSString stringWithFormat:@"司夜刺客"],
                        @"Phantom_Assassin": [NSString stringWithFormat:@"幻影刺客"],
                        @"Phantom_Lancer": [NSString stringWithFormat:@"幻影长毛手"],
                        @"Razor": [NSString stringWithFormat:@"剃刀"],
                        @"Slark": [NSString stringWithFormat:@"斯拉克"],
                        @"Sniper": [NSString stringWithFormat:@"狙击手"],
                        @"Spectre": [NSString stringWithFormat:@"幽鬼"],
                        @"Templar_Assassin": [NSString stringWithFormat:@"圣堂刺客"],
                        @"Terrorblade": [NSString stringWithFormat:@"恐怖利刃"],
                        @"Troll_Warlord": [NSString stringWithFormat:@"巨魔战将"],
                        @"Ursa": [NSString stringWithFormat:@"熊战士"],
                        @"Vengefulspirit": [NSString stringWithFormat:@"复仇之魂"],
                        @"Venomancer": [NSString stringWithFormat:@"剧毒术士"],
                        @"Viper": [NSString stringWithFormat:@"冥界亚龙"],
                        @"Weaver": [NSString stringWithFormat:@"编织者"],
                        @"Ancient_Apparition": [NSString stringWithFormat:@"远古冰魂"],
                        @"Bane": [NSString stringWithFormat:@"祸乱之源"],
                        @"Batrider": [NSString stringWithFormat:@"蝙蝠骑士"],
                        @"Chen": [NSString stringWithFormat:@"陈"],
                        @"Crystal_Maiden": [NSString stringWithFormat:@"水晶室女"],
                        @"Dark_Seer": [NSString stringWithFormat:@"黑暗贤者"],
                        @"Dazzle": [NSString stringWithFormat:@"戴泽"],
                        @"Death_Prophet": [NSString stringWithFormat:@"死亡先知"],
                        @"Disruptor": [NSString stringWithFormat:@"干扰者"],
                        @"Enchantress": [NSString stringWithFormat:@"魅惑魔女"],
                        @"Enigma": [NSString stringWithFormat:@"谜团"],
                        @"Furion": [NSString stringWithFormat:@"先知"],
                        @"Invoker": [NSString stringWithFormat:@"祈求者"],
                        @"Jakiro": [NSString stringWithFormat:@"杰其洛"],
                        @"Keeper_of_the_Light": [NSString stringWithFormat:@"光之守卫"],
                        @"Leshrac": [NSString stringWithFormat:@"拉席克"],
                        @"Lich": [NSString stringWithFormat:@"巫妖"],
                        @"Lina": [NSString stringWithFormat:@"丽娜"],
                        @"Lion": [NSString stringWithFormat:@"恶魔巫师"],
                        @"Necrolyte": [NSString stringWithFormat:@"瘟疫法师"],
                        @"Obsidian_Destroyer": [NSString stringWithFormat:@"殁境神蚀者"],
                        @"Ogre_Magi": [NSString stringWithFormat:@"食人魔魔法师"],
                        @"Puck": [NSString stringWithFormat:@"帕克"],
                        @"Pugna": [NSString stringWithFormat:@"帕格纳"],
                        @"Queen_of_Pain": [NSString stringWithFormat:@"痛苦女王"],
                        @"Rubick": [NSString stringWithFormat:@"拉比克"],
                        @"Shadow_Demon": [NSString stringWithFormat:@"暗影恶魔"],
                        @"Shadow_Shaman": [NSString stringWithFormat:@"暗影撒满"],
                        @"Silencer": [NSString stringWithFormat:@"沉默术士"],
                        @"Skywrath_Mage": [NSString stringWithFormat:@"天怒法师"],
                        @"Storm_Spirit": [NSString stringWithFormat:@"风暴之灵"],
                        @"Tinker": [NSString stringWithFormat:@"修补匠"],
                        @"Visage": [NSString stringWithFormat:@"维萨吉"],
                        @"Warlock": [NSString stringWithFormat:@"术士"],
                        @"Windrunner": [NSString stringWithFormat:@"风行者"],
                        @"Witch_Doctor": [NSString stringWithFormat:@"巫医"],
                        @"Zeus": [NSString stringWithFormat:@"宙斯"],
                        };
    [[self HeroDescription]setText:descriptionDict[self.heroName]];
    //set the heroDetail
    detailDict = @{
                   @"Abaddon": [NSString stringWithFormat:@"Abaddon源于圣经启示录\n代表来自地狱的恶魔"],
                   @"Alchemist": [NSString stringWithFormat:@"Alchemy－炼金术\nAlchemist－炼金师"],
                   @"Axe": [NSString stringWithFormat:@"axe－斧头"],
                   @"Beastmaster": [NSString stringWithFormat:@"beast－野兽\nmaster－大师"],
                   @"Brewmaster": [NSString stringWithFormat:@"brew－酿酒\nmaster－大师"],
                   @"Bristleback": [NSString stringWithFormat:@"bristle－刚毛\nback－后背"],
                   @"Centaur": [NSString stringWithFormat:@"centaur源于希腊神话中半人半马的生物"],
                   @"Chaos_Knight": [NSString stringWithFormat:@"chaos－混乱\nknight－骑士"],
                   @"Doom_Bringer": [NSString stringWithFormat:@"doom－世界末日\nbringer-带来者"],
                   @"Dragon_Knight": [NSString stringWithFormat:@"dragon－龙\nknight－骑士"],
                   @"Earth_Spirit": [NSString stringWithFormat:@"earth－大地\nspirit－灵魂"],
                   @"Earthshaker": [NSString stringWithFormat:@"earthshaker源于希腊神话\n代表引发地震的海皇波塞冬"],
                   @"Elder_Titan": [NSString stringWithFormat:@"elder－年长的，古时候的\ntitan－巨人"],
                   @"Huskar": [NSString stringWithFormat:@"音译－哈斯卡"],
                   @"Kunkka": [NSString stringWithFormat:@"音译－昆卡"],
                   @"Legion_Commander": [NSString stringWithFormat:@"legion－军团\ncommander－指挥官"],
                   @"Life_Stealer": [NSString stringWithFormat:@"life－生命\nstealer-小偷"],
                   @"Lycan": [NSString stringWithFormat:@"源于希腊神话lycanthrope\n和werewolf一个意思"],
                   @"Magnus": [NSString stringWithFormat:@"音译－马格纳斯"],
                   @"Night_Stalker": [NSString stringWithFormat:@"night－夜晚\nstalker－行走者"],
                   @"Omniknight": [NSString stringWithFormat:@"omni－全方位的\nknight－骑士"],
                   @"Phoenix": [NSString stringWithFormat:@"源于希腊神话\n可以重生的鸟"],
                   @"Pudge": [NSString stringWithFormat:@"pudge代表圆胖的人"],
                   @"Rattletrap": [NSString stringWithFormat:@"rattletrap代表摇晃的车辆"],
                   @"Sand_King": [NSString stringWithFormat:@"sand－沙\nking－王"],
                   @"Timbersaw": [NSString stringWithFormat:@"timber－木材\nsaw－锯子（电影电锯惊魂英文就是saw）"],
                   @"Skeleton_King": [NSString stringWithFormat:@"骷髅王"],
                   @"Slardar": [NSString stringWithFormat:@"斯拉达"],
                   @"Spirit_Breaker": [NSString stringWithFormat:@"裂魂人"],
                   @"Sven": [NSString stringWithFormat:@"斯温"],
                   @"Tidehunter": [NSString stringWithFormat:@"潮汐猎人"],
                   @"Tiny": [NSString stringWithFormat:@"小小"],
                   @"Treant": [NSString stringWithFormat:@"树精卫士"],
                   @"Tusk": [NSString stringWithFormat:@"巨牙海民"],
                   @"Undying": [NSString stringWithFormat:@"不朽尸王"],
                   @"Wisp": [NSString stringWithFormat:@"艾欧"],
                   @"Antimage": [NSString stringWithFormat:@"敌法师"],
                   @"Bloodseeker": [NSString stringWithFormat:@"血魔"],
                   @"Bounty_Hunter": [NSString stringWithFormat:@"赏金猎人"],
                   @"Broodmother": [NSString stringWithFormat:@"育母蜘蛛"],
                   @"Clinkz": [NSString stringWithFormat:@"克林克兹"],
                   @"Drow_Ranger": [NSString stringWithFormat:@"卓尔游侠"],
                   @"Ember_Spirit": [NSString stringWithFormat:@"灰烬之灵"],
                   @"Faceless_Void": [NSString stringWithFormat:@"虚空假面"],
                   @"Gyrocopter": [NSString stringWithFormat:@"矮人直升机"],
                   @"Juggernaut": [NSString stringWithFormat:@"主宰"],
                   @"Lone_Druid": [NSString stringWithFormat:@"德鲁伊"],
                   @"Luna": [NSString stringWithFormat:@"露娜"],
                   @"Medusa": [NSString stringWithFormat:@"美杜莎"],
                   @"Meepo": [NSString stringWithFormat:@"米波"],
                   @"Mirana": [NSString stringWithFormat:@"米拉娜"],
                   @"Morphling": [NSString stringWithFormat:@"变体精灵"],
                   @"Naga_Siren": [NSString stringWithFormat:@"娜迦海妖"],
                   @"Nevermore": [NSString stringWithFormat:@"影魔"],
                   @"Nyx_Assassin": [NSString stringWithFormat:@"司夜刺客"],
                   @"Phantom_Assassin": [NSString stringWithFormat:@"幻影刺客"],
                   @"Phantom_Lancer": [NSString stringWithFormat:@"幻影长毛手"],
                   @"Razor": [NSString stringWithFormat:@"剃刀"],
                   @"Slark": [NSString stringWithFormat:@"斯拉克"],
                   @"Sniper": [NSString stringWithFormat:@"狙击手"],
                   @"Spectre": [NSString stringWithFormat:@"幽鬼"],
                   @"Templar_Assassin": [NSString stringWithFormat:@"圣堂刺客"],
                   @"Terrorblade": [NSString stringWithFormat:@"恐怖利刃"],
                   @"Troll_Warlord": [NSString stringWithFormat:@"巨魔战将"],
                   @"Ursa": [NSString stringWithFormat:@"熊战士"],
                   @"Vengefulspirit": [NSString stringWithFormat:@"复仇之魂"],
                   @"Venomancer": [NSString stringWithFormat:@"剧毒术士"],
                   @"Viper": [NSString stringWithFormat:@"冥界亚龙"],
                   @"Weaver": [NSString stringWithFormat:@"编织者"],
                   @"Ancient_Apparition": [NSString stringWithFormat:@"远古冰魂"],
                   @"Bane": [NSString stringWithFormat:@"祸乱之源"],
                   @"Batrider": [NSString stringWithFormat:@"蝙蝠骑士"],
                   @"Chen": [NSString stringWithFormat:@"陈"],
                   @"Crystal_Maiden": [NSString stringWithFormat:@"水晶室女"],
                   @"Dark_Seer": [NSString stringWithFormat:@"黑暗贤者"],
                   @"Dazzle": [NSString stringWithFormat:@"戴泽"],
                   @"Death_Prophet": [NSString stringWithFormat:@"死亡先知"],
                   @"Disruptor": [NSString stringWithFormat:@"干扰者"],
                   @"Enchantress": [NSString stringWithFormat:@"魅惑魔女"],
                   @"Enigma": [NSString stringWithFormat:@"谜团"],
                   @"Furion": [NSString stringWithFormat:@"先知"],
                   @"Invoker": [NSString stringWithFormat:@"祈求者"],
                   @"Jakiro": [NSString stringWithFormat:@"杰其洛"],
                   @"Keeper_of_the_Light": [NSString stringWithFormat:@"光之守卫"],
                   @"Leshrac": [NSString stringWithFormat:@"拉席克"],
                   @"Lich": [NSString stringWithFormat:@"巫妖"],
                   @"Lina": [NSString stringWithFormat:@"丽娜"],
                   @"Lion": [NSString stringWithFormat:@"恶魔巫师"],
                   @"Necrolyte": [NSString stringWithFormat:@"瘟疫法师"],
                   @"Obsidian_Destroyer": [NSString stringWithFormat:@"殁境神蚀者"],
                   @"Ogre_Magi": [NSString stringWithFormat:@"食人魔魔法师"],
                   @"Puck": [NSString stringWithFormat:@"帕克"],
                   @"Pugna": [NSString stringWithFormat:@"帕格纳"],
                   @"Queen_of_Pain": [NSString stringWithFormat:@"痛苦女王"],
                   @"Rubick": [NSString stringWithFormat:@"拉比克"],
                   @"Shadow_Demon": [NSString stringWithFormat:@"暗影恶魔"],
                   @"Shadow_Shaman": [NSString stringWithFormat:@"暗影撒满"],
                   @"Silencer": [NSString stringWithFormat:@"沉默术士"],
                   @"Skywrath_Mage": [NSString stringWithFormat:@"天怒法师"],
                   @"Storm_Spirit": [NSString stringWithFormat:@"风暴之灵"],
                   @"Tinker": [NSString stringWithFormat:@"修补匠"],
                   @"Visage": [NSString stringWithFormat:@"维萨吉"],
                   @"Warlock": [NSString stringWithFormat:@"术士"],
                   @"Windrunner": [NSString stringWithFormat:@"风行者"],
                   @"Witch_Doctor": [NSString stringWithFormat:@"巫医"],
                   @"Zeus": [NSString stringWithFormat:@"宙斯"],
                        };
    [[self HeroDetail]setText:detailDict[self.heroName]];
    //set the ability image
    NSFileManager *fileManager;
    fileManager = [NSFileManager defaultManager];
    NSString *abilityPath = @"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/ability/";
    abilityImage = [fileManager contentsOfDirectoryAtPath:[abilityPath stringByAppendingString:self.heroName] error:nil];
    //set the ability name array
    abilityName = [[NSMutableArray alloc]init];
    for (id s in abilityImage) {
        NSArray *tmp = [[[s componentsSeparatedByString:@"."] objectAtIndex:0] componentsSeparatedByString:@"_"];
        NSString *name = @"";
        int i = 0;
        while (![[tmp objectAtIndex:i] intValue]) {
            i++;
        }
        for (i++; i<tmp.count; i++) {
            name = [name stringByAppendingString:[tmp objectAtIndex:i]];
            if (i != (tmp.count-1)) {
                name = [name stringByAppendingString:@" "];
            }
        }
        [abilityName addObject:name];
    }
    //set the detail of ability
    abilityDetail = @{
                      @"Mist Coil": [NSString stringWithFormat:@"迷雾缠绕\nMist－薄雾 coil－盘绕"],
                      @"Aphotic Shield":[NSString stringWithFormat:@"无光之盾\naphotic－无光的 shield－盾"],
                      @"Frostmourne": [NSString stringWithFormat:@"魔霭诅咒\n没错，这就是霜之哀伤"],
                      @"Borrowed time":[NSString stringWithFormat:@"回光返照\n借来的时间表示即将死亡了"],

                      };

}
//set the table of ability
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [abilityImage count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AbilityTableViewCell *abilityTableCell = [tableView dequeueReusableCellWithIdentifier:@"AbilityID"];
    [abilityTableCell.AbilityImage setImage:[UIImage imageNamed:[abilityImage objectAtIndex:indexPath.row]]];
    [abilityTableCell.AbilityName setText:[abilityName objectAtIndex:indexPath.row]];
    NSString *ability =[abilityName objectAtIndex:indexPath.row];
    [abilityTableCell.AbilityDetail setText:abilityDetail[ability]];
    
    return abilityTableCell;
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
