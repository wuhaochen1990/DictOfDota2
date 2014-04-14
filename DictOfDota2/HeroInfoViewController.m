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
                        };
    [[self HeroDescription]setText:descriptionDict[self.heroName]];
    //set the heroDetail
    detailDict = @{
                   @"Abaddon": [NSString stringWithFormat:@"Abaddon源于圣经启示录代表地狱的恶魔"],
                   @"Alchemist": [NSString stringWithFormat:@"Alchemy－炼金术\nAlchemist－炼金师"],
                   @"Axe": [NSString stringWithFormat:@"axe－斧头"],
                   @"Beastmaster": [NSString stringWithFormat:@"beast－野兽\nmaster－大师"],
                   @"Brewmaster": [NSString stringWithFormat:@"brew－酿酒\nmaster－大师"],
                   @"Bristleback": [NSString stringWithFormat:@"bristle－刚毛\nback－后背"],
                   @"Centaur": [NSString stringWithFormat:@"centaur源于希腊神话中半人半马的生物"],
                   @"Chaos_Knight": [NSString stringWithFormat:@"chaos－混乱\nknight－骑士"],
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
