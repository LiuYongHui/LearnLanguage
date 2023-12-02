//
//  YHMainVC.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/14.
//

#import "YHMainVC.h"
#import "HomeVC.h"
#import "DiscoverVC.h"
#import "MineVC.h"
@interface YHMainVC ()

@end

@implementation YHMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIViewController *mainVC = [self getClassName:@"HomeVC" nameTitle:@"首页" imageName:@"tarbar-homepage"];
    UIViewController *discoverVC = [self getClassName:@"DiscoverVC" nameTitle:@"发现" imageName:@"tabbar_sjyx"];
    UIViewController *mineVC = [self getClassName:@"MineVC" nameTitle:@"我的" imageName:@"tarbar-person"];
    self.viewControllers = @[mainVC,discoverVC,mineVC];
}

- (UIViewController *)getClassName:(NSString *)classStr nameTitle:(NSString *)nameTitle imageName:(NSString *)imageName {
    Class cls = NSClassFromString(classStr);
    UIViewController *vc = [[cls alloc] init];
    NSAssert([vc isKindOfClass:[UIViewController class]], @"%@类名有误",classStr);
    vc.title = nameTitle;
    vc.tabBarItem.image = [[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@Select",imageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.orangeColor} forState:UIControlStateSelected];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:UIColor.grayColor} forState:UIControlStateNormal];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
