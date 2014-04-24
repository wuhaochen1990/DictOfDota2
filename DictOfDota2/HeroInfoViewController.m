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
    self.HeroImage.layer.CornerRadius=30;
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
                        @"Wraith_King": [NSString stringWithFormat:@"冥魂大帝"],
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
                        @"Phantom_Lancer": [NSString stringWithFormat:@"幻影长矛手"],
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
                   @"Wraith_King": [NSString stringWithFormat:@"wraith－鬼魂\nking－王"],
                   @"Slardar": [NSString stringWithFormat:@"音译－斯拉达"],
                   @"Spirit_Breaker": [NSString stringWithFormat:@"spirit－灵魂\nbreaker－破坏者"],
                   @"Sven": [NSString stringWithFormat:@"音译－斯温"],
                   @"Tidehunter": [NSString stringWithFormat:@"tide－潮汐\nhunter－猎人"],
                   @"Tiny": [NSString stringWithFormat:@"tiny代表很小的\n却被经常用来形容块头很大的人"],
                   @"Treant": [NSString stringWithFormat:@"treant源于游戏“龙与地下城”\n树状的生物"],
                   @"Tusk": [NSString stringWithFormat:@"tusk－长牙"],
                   @"Undying": [NSString stringWithFormat:@"undying－不死的"],
                   @"Wisp": [NSString stringWithFormat:@"wisp－小捆"],
                   @"Antimage": [NSString stringWithFormat:@"anti－反抗\nmage－魔法师"],
                   @"Bloodseeker": [NSString stringWithFormat:@"blood－血\nseeker－搜寻者"],
                   @"Bounty_Hunter": [NSString stringWithFormat:@"bounty－赏金\nhunter－猎人"],
                   @"Broodmother": [NSString stringWithFormat:@"brood－孵\nmother－母亲"],
                   @"Clinkz": [NSString stringWithFormat:@"音译－克林克兹"],
                   @"Drow_Ranger": [NSString stringWithFormat:@"drow－黑暗精灵\nranger－漫游者"],
                   @"Ember_Spirit": [NSString stringWithFormat:@"ember－灰烬\nspirit－灵魂"],
                   @"Faceless_Void": [NSString stringWithFormat:@"faceless－没脸的\nvoid－虚空"],
                   @"Gyrocopter": [NSString stringWithFormat:@"源于autogyro\n代表自动旋翼的飞机"],
                   @"Juggernaut": [NSString stringWithFormat:@"juggernaut源于印度的一种碾轧信徒的车\n代表有压制性的，主导的"],
                   @"Lone_Druid": [NSString stringWithFormat:@"druid－德鲁伊"],
                   @"Luna": [NSString stringWithFormat:@"音译－露娜"],
                   @"Medusa": [NSString stringWithFormat:@"音译－美杜莎\n源于希腊神话中蛇发女妖"],
                   @"Meepo": [NSString stringWithFormat:@"音译－米波"],
                   @"Mirana": [NSString stringWithFormat:@"音译－米拉娜"],
                   @"Morphling": [NSString stringWithFormat:@"shapeshifter的一种"],
                   @"Naga_Siren": [NSString stringWithFormat:@"naga－娜迦\nsiren－源于希腊神话的唱歌的女妖"],
                   @"Nevermore": [NSString stringWithFormat:@"Nevermore是名字\nSF是shadow影子fiend恶魔"],
                   @"Nyx_Assassin": [NSString stringWithFormat:@"nyx－源于希腊神话中司夜女神\nassassin－刺客"],
                   @"Phantom_Assassin": [NSString stringWithFormat:@"phantom－幻影\nassassin－刺客"],
                   @"Phantom_Lancer": [NSString stringWithFormat:@"phantom－幻影\nlancer－源于19世纪法国的长矛轻骑兵"],
                   @"Razor": [NSString stringWithFormat:@"直译－剃刀"],
                   @"Slark": [NSString stringWithFormat:@"音译－斯拉克"],
                   @"Sniper": [NSString stringWithFormat:@"直译－狙击手"],
                   @"Spectre": [NSString stringWithFormat:@"源于动画人物\n像幽灵一样的英雄"],
                   @"Templar_Assassin": [NSString stringWithFormat:@"templar－圣堂\nassassin－刺客"],
                   @"Terrorblade": [NSString stringWithFormat:@"terror－恐怖\nblade－利刃"],
                   @"Troll_Warlord": [NSString stringWithFormat:@"troll－北欧神话中的巨人\nwarlord－战神"],
                   @"Ursa": [NSString stringWithFormat:@"音译－乌萨尔\n熊战士"],
                   @"Vengefulspirit": [NSString stringWithFormat:@"vengeful－复仇\nspirit－灵魂"],
                   @"Venomancer": [NSString stringWithFormat:@"venom－毒液"],
                   @"Viper": [NSString stringWithFormat:@"直译－毒如蛇蝎的人"],
                   @"Weaver": [NSString stringWithFormat:@"直译－编织者"],
                   @"Ancient_Apparition": [NSString stringWithFormat:@"ancient－远古\napparition－幽灵，鬼魂"],
                   @"Bane": [NSString stringWithFormat:@"直译－毒药，祸害"],
                   @"Batrider": [NSString stringWithFormat:@"bat－蝙蝠\nrider－骑士"],
                   @"Chen": [NSString stringWithFormat:@"音译－陈"],
                   @"Crystal_Maiden": [NSString stringWithFormat:@"cystal－水晶\nmaiden－处女，少女"],
                   @"Dark_Seer": [NSString stringWithFormat:@"dark－黑暗\nseer－预言家，先知"],
                   @"Dazzle": [NSString stringWithFormat:@"音译－戴泽"],
                   @"Death_Prophet": [NSString stringWithFormat:@"death－死亡\nprophet－先知"],
                   @"Disruptor": [NSString stringWithFormat:@"直译－干扰者"],
                   @"Enchantress": [NSString stringWithFormat:@"enchant－使迷惑"],
                   @"Enigma": [NSString stringWithFormat:@"直译－谜团"],
                   @"Furion": [NSString stringWithFormat:@"nature prophet大自然的先知"],
                   @"Invoker": [NSString stringWithFormat:@"直译－祈求者"],
                   @"Jakiro": [NSString stringWithFormat:@"音译－杰奇洛"],
                   @"Keeper_of_the_Light": [NSString stringWithFormat:@"直译－光之守卫"],
                   @"Leshrac": [NSString stringWithFormat:@"音译－拉席克"],
                   @"Lich": [NSString stringWithFormat:@"源于奇幻小说\n利用魔法不死的施法者"],
                   @"Lina": [NSString stringWithFormat:@"音译－丽娜"],
                   @"Lion": [NSString stringWithFormat:@"名字是莱恩"],
                   @"Necrolyte": [NSString stringWithFormat:@"necro－瘟疫法师"],
                   @"Obsidian_Destroyer": [NSString stringWithFormat:@"obsidian－黑曜石\ndestroyer－毁灭者"],
                   @"Ogre_Magi": [NSString stringWithFormat:@"ogre－源于童话故事的食人魔\nmagi－魔法师"],
                   @"Puck": [NSString stringWithFormat:@"音译－帕克"],
                   @"Pugna": [NSString stringWithFormat:@"音译－帕格纳"],
                   @"Queen_of_Pain": [NSString stringWithFormat:@"直译－痛苦女王"],
                   @"Rubick": [NSString stringWithFormat:@"音译－拉比克"],
                   @"Shadow_Demon": [NSString stringWithFormat:@"直译－暗影恶魔"],
                   @"Shadow_Shaman": [NSString stringWithFormat:@"直译－shadow暗影\n音译－shaman撒满"],
                   @"Silencer": [NSString stringWithFormat:@"silence－静默"],
                   @"Skywrath_Mage": [NSString stringWithFormat:@"sky－天\nwrath－愤怒（七宗罪之一）"],
                   @"Storm_Spirit": [NSString stringWithFormat:@"storm－风暴\nspirit－灵魂"],
                   @"Tinker": [NSString stringWithFormat:@"直译－修补匠"],
                   @"Visage": [NSString stringWithFormat:@"音译－维萨吉"],
                   @"Warlock": [NSString stringWithFormat:@"直译－术士"],
                   @"Windrunner": [NSString stringWithFormat:@"直译－风行者"],
                   @"Witch_Doctor": [NSString stringWithFormat:@"直译－巫医"],
                   @"Zeus": [NSString stringWithFormat:@"音译－宙斯\n希腊神话众神之王"],
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
        if ([s  isEqual: @".DS_Store"]) {
            NSLog(@"I have dsstore");
            continue;
        }
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
                      @"Acid Spray": [NSString stringWithFormat:@"酸性喷雾\nacid－酸 spray－喷射"],
                      @"Unstable Concoction": [NSString stringWithFormat:@"不稳定化合物\nunstable－不稳定 concoction－混合物"],
                      @"Greevil's Greed": [NSString stringWithFormat:@"贪魔的贪婪\ngreevil－贪魔 greed－贪婪"],
                      @"Chemical Rage": [NSString stringWithFormat:@"化学狂暴\nchemical－化学的 rage－暴怒"],
                      @"Unstable Concoction Throw": [NSString stringWithFormat:@"投掷不稳定化合物\nthrow－投掷"],
                      @"Berserker's Call": [NSString stringWithFormat:@"狂战士的怒吼\nbberserker－狂暴战士 call－怒吼"],
                      @"Battle Hunger": [NSString stringWithFormat:@"战争饥渴\nbattle－战争 hunger－饥渴"],
                      @"Counter Helix": [NSString stringWithFormat:@"反击螺旋\ncounter－反 helix－螺旋"],
                      @"Culling Blade": [NSString stringWithFormat:@"淘汰之刃\nculling－从大批货物中剔除次品 blade－刀刃"],
                      @"Wild Axes": [NSString stringWithFormat:@"野性之斧\nwild－野性 axe－斧头"],
                      @"Call of the Wild Hawk": [NSString stringWithFormat:@"野性召唤战鹰\ncall－召唤 hawk－鹰"],
                      @"Call of the Wild Boar": [NSString stringWithFormat:@"野性召唤野猪\ncall－召唤 boar－野猪"],
                      @"Inner Beast": [NSString stringWithFormat:@"野性之心\ninner－内在的 beast－野兽"],
                      @"Primal Roar": [NSString stringWithFormat:@"原始咆哮\nprimal－原始 roar－咆哮"],
                      @"Thunder Clap": [NSString stringWithFormat:@"雷霆一击\nthunder－雷霆 clap－击掌"],
                      @"Drunken Haze": [NSString stringWithFormat:@"醉酒云雾\ndrunken－喝醉了 haze－薄雾"],
                      @"Drunken Brawler": [NSString stringWithFormat:@"醉拳\nbrawler－争吵"],
                      @"Primal Split": [NSString stringWithFormat:@"元素分离\nprimal－原始 split－分离"],
                      @"Viscous Nasal Goo": [NSString stringWithFormat:@"粘稠鼻液\nviscous－粘性nasal－鼻goo－粘性物"],
                      @"Quill Spray": [NSString stringWithFormat:@"刺针扫射\nquill－刚毛，刺射 spray－喷射"],
                      @"Bristleback": [NSString stringWithFormat:@"刚毛后背\n冠名的技能"],
                      @"Warpath": [NSString stringWithFormat:@"战意\nwar－战争 path－路径"],
                      @"Hoof Stomp": [NSString stringWithFormat:@"马蹄践踏\nhoof－蹄 stomp－践踏"],
                      @"Double Edge": [NSString stringWithFormat:@"双刃剑\ndouble－双 edge－边，刃"],
                      @"Return": [NSString stringWithFormat:@"反击\nreturn－返回"],
                      @"Stampede": [NSString stringWithFormat:@"猛袭冲撞\nstampede－蜂拥"],
                      @"Chaos Bolt": [NSString stringWithFormat:@"混乱之箭\nchaos－混乱 bolt－弩箭"],
                      @"Reality Rift": [NSString stringWithFormat:@"实相裂隙\nreality－现实 rift－裂缝"],
                      @"Chaos Strike": [NSString stringWithFormat:@"混乱一击\nstrike－击打"],
                      @"Phantasm": [NSString stringWithFormat:@"幻想\nphantasm－幻想，幽灵"],
                      @"Devour": [NSString stringWithFormat:@"吞噬\ndevour－吞食，毁灭"],
                      @"Scorched Earth": [NSString stringWithFormat:@"焦土\nscorch－灼烧 earth－土地"],
                      @"Lvl Death": [NSString stringWithFormat:@"死亡\nlvl-level等级 death－死亡"],
                      @"Doom": [NSString stringWithFormat:@"末日\n冠名的技能"],
                      @"Breathe Fire": [NSString stringWithFormat:@"火焰气息\nbreathe－呼吸 fire－火焰"],
                      @"Dragon Tail": [NSString stringWithFormat:@"神龙摆尾\ndragon－龙 tail－尾巴"],
                      @"Dragon Blood": [NSString stringWithFormat:@"龙族血统\ndragon－龙 blood－血"],
                      @"Elder Dragon Form": [NSString stringWithFormat:@"真龙形态\nelder－上古的 form－形态"],
                      @"Boulder Smash": [NSString stringWithFormat:@"巨石冲击\nboulder－巨石 smash－冲突"],
                      @"Rolling Boulder": [NSString stringWithFormat:@"巨石翻滚\nrolling-滚 boulder-巨石"],
                      @"Geomagnetic Grip": [NSString stringWithFormat:@"地磁之握\ngeomagnetic－地磁 grip－紧握"],
                      @"Stone Caller": [NSString stringWithFormat:@"残岩\ncaller－召唤 stone－石头"],
                      @"Magnetize": [NSString stringWithFormat:@"磁化\nmagnetize－磁化"],
                      @"Fissure": [NSString stringWithFormat:@"沟壑\nfissure－裂缝"],
                      @"Enchant Totem": [NSString stringWithFormat:@"强化图腾\nenchant－使迷惑 totem－图腾"],
                      @"Aftershock": [NSString stringWithFormat:@"余震\naftershock－摇晃之后就是余震"],
                      @"Echo Slam": [NSString stringWithFormat:@"回音击\necho－回音 slam－击打，扣篮"],
                      @"Echo Stomp": [NSString stringWithFormat:@"回音重塔\necho－回音 stomp－践踏"],
                      @"Ancestral Spirit": [NSString stringWithFormat:@"星体游魂\nancenstral－祖先的"],
                      @"Natural Order": [NSString stringWithFormat:@"自然秩序\nnatural－自然的 order－秩序"],
                      @"Return Spirit": [NSString stringWithFormat:@"星体游魂回归"],
                      @"Earth Splitter": [NSString stringWithFormat:@"裂地沟壑\nearth－大地 splitter－分裂"],
                      @"Inner Vitality": [NSString stringWithFormat:@"活血术\ninner－内在的 vitality－生命力"],
                      @"Burning Spear": [NSString stringWithFormat:@"沸血之矛\nburning－燃烧的 spear－矛"],
                      @"Berserkers Blood": [NSString stringWithFormat:@"狂战士之血\nberserker－狂战士 blood－血"],
                      @"Life Break": [NSString stringWithFormat:@"牺牲\nlife－生命 break－断绝"],
                      @"Torrent": [NSString stringWithFormat:@"洪流\ntorrent－洪流，在这里不是种子的意思"],
                      @"Tidebringer": [NSString stringWithFormat:@"潮汐使者\ntide－潮汐 bringer－使者"],
                      @"X Marks the Spot": [NSString stringWithFormat:@"X标记\nmark－标记 spot－地点"],
                      @"Ghostship": [NSString stringWithFormat:@"幽灵船\nghost－幽灵 ship－船"],
                      @"X Marks Return": [NSString stringWithFormat:@"送回"],
                      @"Overwhelming Odds": [NSString stringWithFormat:@"压倒性优势\noverwhelming－压倒性 odds－胜算"],
                      @"Press the Attack": [NSString stringWithFormat:@"强攻\npress－强压 attack－进攻"],
                      @"Moment of Courage": [NSString stringWithFormat:@"勇气之霎\nmoment－瞬间 courage－勇气"],
                      @"Duel": [NSString stringWithFormat:@"决斗\nduel－决斗，战斗"],
                      @"Rage": [NSString stringWithFormat:@"狂暴\nrage－狂怒"],
                      @"Feast": [NSString stringWithFormat:@"盛宴\nfeast－筵席"],
                      @"Open Wounds": [NSString stringWithFormat:@"撕裂伤口\nwounds－伤口"],
                      @"Infest": [NSString stringWithFormat:@"感染\ninfest－寄生"],
                      @"Consume": [NSString stringWithFormat:@"吞噬\nconsume－消费，耗尽生命"],
                      @"Summon Wolves": [NSString stringWithFormat:@"召狼\nsummon－召唤 wolf－狼"],
                      @"Howl": [NSString stringWithFormat:@"嗥叫\nhowl－狼嗥"],
                      @"Feral Impulse": [NSString stringWithFormat:@"野性驱使\nferal－野生的，凶猛的 impulse－推动"],
                      @"Shapeshift": [NSString stringWithFormat:@"变形\nshape－形状 shift－变换"],
                      @"Shockwave": [NSString stringWithFormat:@"震荡波\nshock－震荡 wave－波"],
                      @"Empower": [NSString stringWithFormat:@"授予力量\nempower－给力量"],
                      @"Skewer": [NSString stringWithFormat:@"巨角冲撞\nskewer－刺穿"],
                      @"Reverse Polarity": [NSString stringWithFormat:@"两极反转\nreverse反转 polarity－两极"],
                      @"Void": [NSString stringWithFormat:@"虚空\n和虚空假面一个词"],
                      @"Crippling Fear": [NSString stringWithFormat:@"伤残恐惧\ncripple－残废 fear－恐惧"],
                      @"Hunter in the Night": [NSString stringWithFormat:@"夜晚中的狩猎者\nhunter－猎人"],
                      @"Darkness": [NSString stringWithFormat:@"黑暗时间\ndark－黑暗的"],
                      @"Purification": [NSString stringWithFormat:@"洗礼\npure－纯洁 purify－使纯洁"],
                      @"Repel": [NSString stringWithFormat:@"驱逐\nrepel－击退"],
                      @"Degen Aura": [NSString stringWithFormat:@"退化光环\ndegen－degeneration退化 aura－光环"],
                      @"Guardian Angel": [NSString stringWithFormat:@"守护天使\nguardian－守护者 angel－天使"],
                      @"Icarus Dive": [NSString stringWithFormat:@"凤凰冲击\nIcarus－源于希腊神话飞向太阳而死"],
                      @"Fire Spirits": [NSString stringWithFormat:@"烈火精灵\nfire－火 spirit－灵"],
                      @"Sun Ray": [NSString stringWithFormat:@"烈日炙烤\nsun－太阳 ray－放射光线"],
                      @"Supernova": [NSString stringWithFormat:@"超新星\nsupernova－凤凰终结现生命获得重生"],
                      @"Launch Fire Spirit": [NSString stringWithFormat:@"发动烈火精灵\nlaunch－发射"],
                      @"Icarus Dive Stop": [NSString stringWithFormat:@"终止凤凰冲击"],
                      @"Sun Ray Stop": [NSString stringWithFormat:@"终止烈日炙烤"],
                      @"Sun Ray Toggle Move": [NSString stringWithFormat:@"切换移动状态\ntoggle－触发"],
                      @"Meat Hook": [NSString stringWithFormat:@"肉钩\nmeat－肉 hook－钩"],
                      @"Rot": [NSString stringWithFormat:@"腐烂"],
                      @"Flesh Heap": [NSString stringWithFormat:@"腐肉堆积\nflesh－血肉 heap－堆"],
                      @"Dismember": [NSString stringWithFormat:@"肢解\ndismember－割断手足"],
                      @"Battery Assault": [NSString stringWithFormat:@"弹幕冲击\nbattery－电池 assault－攻击"],
                      @"Power Cogs": [NSString stringWithFormat:@"能量齿轮\npower－能量 cog－齿轮"],
                      @"Rocket Flare": [NSString stringWithFormat:@"照明火箭\nrocket－火箭 flare－火花"],
                      @"Hookshot": [NSString stringWithFormat:@"发射钩爪\nhook－钩 shot－发射"],
                      @"Burrowstrike": [NSString stringWithFormat:@"掘地穿刺\nburrow－挖掘 strike－穿透"],
                      @"Sand Storm": [NSString stringWithFormat:@"沙尘暴\nstorm－风暴"],
                      @"Caustic Finale": [NSString stringWithFormat:@"腐尸毒\ncaustic－腐蚀性 finale－结局"],
                      @"Epicenter": [NSString stringWithFormat:@"地震\nepicenter－地震中心"],
                      @"Sprint": [NSString stringWithFormat:@"冲刺\nsprint－短跑冲刺"],
                      @"Slithereen Crush": [NSString stringWithFormat:@"鱼人碎击\ncrush－压碎"],
                      @"Bash": [NSString stringWithFormat:@"重击\nbash－猛的一击"],
                      @"Amplify Damage": [NSString stringWithFormat:@"伤害加深\namplify－扩大 damage－伤害"],
                      @"Charge of Darkness": [NSString stringWithFormat:@"暗影冲刺\ncharge－冲锋"],
                      @"Empowering Haste": [NSString stringWithFormat:@"神行太保\nempower－赐予力量 haste－极速"],
                      @"Greater Bash": [NSString stringWithFormat:@"巨力重击\ngreater－大的 bash－击打"],
                      @"Nether Strike": [NSString stringWithFormat:@"幽冥一击\nnether－下界的"],
                      @"Storm Bolt": [NSString stringWithFormat:@"风暴之锤\nbolt－弩箭"],
                      @"Great Cleave": [NSString stringWithFormat:@"巨力挥舞\ncleave－砍开"],
                      @"Warcry": [NSString stringWithFormat:@"战吼\ncry－叫喊"],
                      @"Gods Strength": [NSString stringWithFormat:@"神之力量"],
                      @"Gush": [NSString stringWithFormat:@"巨浪\ngush－涌出"],
                      @"Kraken Shell": [NSString stringWithFormat:@"海妖外壳\nkraken－北海巨妖"],
                      @"Anchor Smash": [NSString stringWithFormat:@"锚击\nanchor－锚 smash－击打"],
                      @"Ravage": [NSString stringWithFormat:@"毁灭\nravage－蹂躏，破坏"],
                      @"Whirling Death": [NSString stringWithFormat:@"死亡旋风\nwhirl－回旋"],
                      @"Timber Chain": [NSString stringWithFormat:@"伐木锯链\ntimber－木材 chain－链"],
                      @"Reactive Armor": [NSString stringWithFormat:@"活性护甲\nreactive－活性 armor－护甲"],
                      @"Chakram": [NSString stringWithFormat:@"锯齿飞轮\nchakram－源于印度的武器环刃"],
                      @"Return Chakram": [NSString stringWithFormat:@"收回锯齿飞轮"],
                      @"Avalanche": [NSString stringWithFormat:@"山崩\navalanche－雪崩"],
                      @"Toss": [NSString stringWithFormat:@"投掷\ntoss－投掷"],
                      @"Craggy Exterior": [NSString stringWithFormat:@"崎岖外表\ncraggy－崎岖 exterior－外表"],
                      @"Grow": [NSString stringWithFormat:@"长大\ngrow－生长"],
                      @"Natures Guise": [NSString stringWithFormat:@"大自然的掩护\nguise－掩护"],
                      @"Leech Seed": [NSString stringWithFormat:@"寄生种子\nleech-寄生 seed－种子"],
                      @"Living Armor": [NSString stringWithFormat:@"活体护甲\nliving－活体的"],
                      @"Overgrowth": [NSString stringWithFormat:@"疯狂生长\nover－过分的"],
                      @"Ice Shards": [NSString stringWithFormat:@"寒冰碎片\nshard－碎片"],
                      @"Snowball": [NSString stringWithFormat:@"雪球"],
                      @"Frozen Sigil": [NSString stringWithFormat:@"冰封魔印\nsigil－魔符"],
                      @"Walrus Punch": [NSString stringWithFormat:@"海象神拳\nwalrus－海象 punch－拳"],
                      @"Decay": [NSString stringWithFormat:@"腐朽\ndecay－衰退，腐烂"],
                      @"Soul Rip": [NSString stringWithFormat:@"噬魂\nsoul－灵魂 rip－撕裂"],
                      @"Tombstone": [NSString stringWithFormat:@"墓碑"],
                      @"Flesh Golem": [NSString stringWithFormat:@"血肉傀儡\ngolem－源于希伯来传说有生命的假人"],
                      @"Tether": [NSString stringWithFormat:@"闪电之链\ntether－系链子"],
                      @"Tether Break": [NSString stringWithFormat:@"断开链接"],
                      @"Spirits": [NSString stringWithFormat:@"幽光之魂"],
                      @"Overcharge": [NSString stringWithFormat:@"过载\ncharge－充电，负载"],
                      @"Relocate": [NSString stringWithFormat:@"降临\nrelocate－迁移"],
                      @"Spirits In": [NSString stringWithFormat:@"拉近幽光之魂"],
                      @"Spirits Out": [NSString stringWithFormat:@"拉远幽光之魂"],
                      @"Hellfire Blast": [NSString stringWithFormat:@"冥火爆击\nhellfire－地狱火 blast－爆击"],
                      @"Vampiric Aura": [NSString stringWithFormat:@"吸血光环\nvampiric－吸血"],
                      @"Mortal Strike": [NSString stringWithFormat:@"殊死一搏\nmortal－终有一死的"],
                      @"Reincarnation": [NSString stringWithFormat:@"重生\nreincarnation－再生，化身"],
                      @"Mana Break": [NSString stringWithFormat:@"法力损毁\nmana－魔法 break－破坏"],
                      @"Blink": [NSString stringWithFormat:@"闪烁"],
                      @"Spell Shield": [NSString stringWithFormat:@"法术护盾\nspell－咒语 shield－盾"],
                      @"Mana Void": [NSString stringWithFormat:@"法力虚空\nvoid－虚空"],
                      @"Bloodrage": [NSString stringWithFormat:@"血之狂暴\nrage－狂暴，暴怒"],
                      @"Blood Bath": [NSString stringWithFormat:@"屠戮\nbath－沐浴"],
                      @"Thirst": [NSString stringWithFormat:@"嗜血渴望\nthirst－饥渴"],
                      @"Rupture": [NSString stringWithFormat:@"割裂\nrupture－破裂，决裂"],
                      @"Shuriken Toss": [NSString stringWithFormat:@"投掷飞镖\nshuriken－源于日本的手里剑"],
                      @"Jinada": [NSString stringWithFormat:@"忍术\njinada－源于朝鲜语时光的流逝"],
                      @"Wind Walk": [NSString stringWithFormat:@"疾风步"],
                      @"Track": [NSString stringWithFormat:@"追踪术\ntrack－追踪"],
                      @"Spawn Spiderlings": [NSString stringWithFormat:@"孵化蜘蛛\nspawn－产卵 spiderling－幼蛛"],
                      @"Spin Web": [NSString stringWithFormat:@"织网\nspin－吐丝 web－网"],
                      @"Incapacitating Bite": [NSString stringWithFormat:@"麻痹之咬\nincapacitate－使人无力"],
                      @"Insatiable Hunger": [NSString stringWithFormat:@"极度饥渴\ninsatiable－不知足的"],
                      @"Strafe": [NSString stringWithFormat:@"扫射\nstrafe－炮轰，扫射"],
                      @"Searing Arrows": [NSString stringWithFormat:@"灼热之箭\nsearing－灼热的"],
                      @"Death Pact": [NSString stringWithFormat:@"死亡契约\npact－合约"],
                      @"Frost Arrows": [NSString stringWithFormat:@"霜冻之箭\nfrost－霜"],
                      @"Gust": [NSString stringWithFormat:@"狂风\ngust－一阵风"],
                      @"Precision Aura": [NSString stringWithFormat:@"强击光环\nprecision－准确"],
                      @"Marksmanship": [NSString stringWithFormat:@"射手天赋\nmarksman－神射手"],
                      @"Searing Chains": [NSString stringWithFormat:@"炎阳索"],
                      @"Sleight of Fist": [NSString stringWithFormat:@"无影拳\nsleight－诡计，熟练"],
                      @"Flame Guard": [NSString stringWithFormat:@"烈火罩\nguard－守卫"],
                      @"Activate Fire Remnant": [NSString stringWithFormat:@"激活残焰\nremnant－残余"],
                      @"Fire Remnant": [NSString stringWithFormat:@"残焰"],
                      @"Time Walk": [NSString stringWithFormat:@"时间漫游"],
                      @"Backtrack": [NSString stringWithFormat:@"回到过去"],
                      @"Time Lock": [NSString stringWithFormat:@"时间锁定"],
                      @"Chronosphere": [NSString stringWithFormat:@"时间结界\nchrono－长期的 sphere－范围"],
                      @"Rocket Barrage": [NSString stringWithFormat:@"火箭弹幕\nbarrage－弹幕，齐射"],
                      @"Homing Missile": [NSString stringWithFormat:@"追踪导弹\nhoming－自动导引的 missile－导弹"],
                      @"Flak Cannon": [NSString stringWithFormat:@"高射火炮\nflak－高射炮 cannon－大炮"],
                      @"Call Down": [NSString stringWithFormat:@"召唤飞弹"],
                      


                      


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
