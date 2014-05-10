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
    NSArray *strHeroNameTemp;
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
    
    //NSFileManager *fileManager;
    //fileManager = [NSFileManager defaultManager];
    //strHeroImage = [fileManager contentsOfDirectoryAtPath:@"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/strength" error:nil];
    strHeroImage = [[NSArray alloc]initWithObjects:
                    @"Abaddon.png",
                    @"Alchemist.png",
                    @"Axe.png",
                    @"Beastmaster.png",
                    @"Brewmaster.png",
                    @"Bristleback.png",
                    @"Centaur.png",
                    @"Chaos_Knight.png",
                    @"Doom_Bringer.png",
                    @"Dragon_Knight.png",
                    @"Earth_Spirit.png",
                    @"Earthshaker.png",
                    @"Elder_Titan.png",
                    @"Huskar.png",
                    @"Kunkka.png",
                    @"Legion_Commander.png",
                    @"Life_Stealer.png",
                    @"Lycan.png",
                    @"Magnus.png",
                    @"Night_Stalker.png",
                    @"Omniknight.png",
                    @"Phoenix.png",
                    @"Pudge.png",
                    @"Rattletrap.png",
                    @"Sand_King.png",
                    @"Slardar.png",
                    @"Spirit_Breaker.png",
                    @"Sven.png",
                    @"Tidehunter.png",
                    @"Timbersaw.png",
                    @"Tiny.png",
                    @"Treant.png",
                    @"Tusk.png",
                    @"Undying.png",
                    @"Wisp.png",
                    @"Wraith_King.png", nil];
    //agiHeroImage = [fileManager contentsOfDirectoryAtPath:@"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/agility" error:nil];
    //intHeroImage = [fileManager contentsOfDirectoryAtPath:@"/Users/haochenwu/Dropbox/gwu 2nd semester/dota2/images/hero/intelligence" error:nil];
    agiHeroImage = [[NSArray alloc]initWithObjects:
                    @"Antimage.png",
                    @"Bloodseeker.png",
                    @"Bounty_Hunter.png",
                    @"Broodmother.png",
                    @"Clinkz.png",
                    @"Drow_Ranger.png",
                    @"Ember_Spirit.png",
                    @"Faceless_Void.png",
                    @"Gyrocopter.png",
                    @"Juggernaut.png",
                    @"Lone_Druid.png",
                    @"Luna.png",
                    @"Medusa.png",
                    @"Meepo.png",
                    @"Mirana.png",
                    @"Morphling.png",
                    @"Naga_Siren.png",
                    @"Nevermore.png",
                    @"Nyx_Assassin.png",
                    @"Phantom_Assassin.png",
                    @"Phantom_Lancer.png",
                    @"Razor.png",
                    @"Slark.png",
                    @"Sniper.png",
                    @"Spectre.png",
                    @"Templar_Assassin.png",
                    @"Terrorblade.png",
                    @"Troll_Warlord.png",
                    @"Ursa.png",
                    @"Vengefulspirit.png",
                    @"Venomancer.png",
                    @"Viper.png",
                    @"Weaver.png", nil];
    intHeroImage = [[NSArray alloc]initWithObjects:
                    @"Ancient_Apparition.png",
                    @"Bane.png",
                    @"Batrider.png",
                    @"Chen.png",
                    @"Crystal_Maiden.png",
                    @"Dark_Seer.png",
                    @"Dazzle.png",
                    @"Death_Prophet.png",
                    @"Disruptor.png",
                    @"Enchantress.png",
                    @"Enigma.png",
                    @"Furion.png",
                    @"Invoker.png",
                    @"Jakiro.png",
                    @"Keeper_of_the_Light.png",
                    @"Leshrac.png",
                    @"Lich.png",
                    @"Lina.png",
                    @"Lion.png",
                    @"Necrolyte.png",
                    @"Obsidian_Destroyer.png",
                    @"Ogre_Magi.png",
                    @"Puck.png",
                    @"Pugna.png",
                    @"Queen_of_Pain.png",
                    @"Rubick.png",
                    @"Shadow_Demon.png",
                    @"Shadow_Shaman.png",
                    @"Silencer.png",
                    @"Skywrath_Mage.png",
                    @"Storm_Spirit.png",
                    @"Tinker.png",
                    @"Visage.png",
                    @"Warlock.png",
                    @"Windrunner.png",
                    @"Witch_Doctor.png",
                    @"Zeus.png", nil];
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
    [hero.layer setCornerRadius:3.0f];
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
