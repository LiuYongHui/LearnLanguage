//
//  SceneDelegate.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/4/18.
//

#import "SceneDelegate.h"
#import "YHMainVC.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

//加载场景时调用
- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    if(scene) {
        UIWindowScene *winScene = (UIWindowScene *)scene;
        self.window = [[UIWindow alloc] initWithWindowScene:winScene];
        self.window.backgroundColor = UIColor.redColor;
        self.window.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        YHMainVC *mainVC = [[YHMainVC alloc] init];
        self.window.rootViewController = mainVC;
        [self.window makeKeyAndVisible];
    }
}

//当场景被系统释放时调用
- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}

//当场景从后台进入前台时调用，即已经从后台进入前台
- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}

//当场景即将从前台进入后台时调用
- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}

//当场景从背景过渡到前景时调用，即将从后台进入到前台时
- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}

//当场景从前景过渡到背景时调用，即已经从前台进入到后台
- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
