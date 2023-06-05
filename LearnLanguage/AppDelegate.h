/*
 语言笔记
 
 OC不支持多重继承 可以实现多个接口 通过实现多个接口完成C++的多重继承
 Category是类别 用Category去重写类的方法，只对本Category有效
 #import是OC导入关键字 #include是C/C++导入头文件的关键字
 #import自动只会一次
 NSString *obj = [[NSData alloc] init]; 编译时是NSString类型 运行时是NSData类型的对象
 
 Id声明的对象具有运行时的特性，即可以指向任意类型的OC对象
 内存管理的三种方式ARC、手动内存计数、内存池
 内存管理主要避免“过早释放”和“内存泄漏”
 iOS设备性能测试：Open Developer Tools->Instruments->Time Profile
 创建线程的方法：使用NSThread创建、使用GCD的dispatch、使用子类化的NSOperation然后加入NSOperationQueue；
 在主线程执行代码方法：performSelectOnMainThread 延时执行代码可以用performSelector:onThread:withObject:waitUntilDone
 MVC开发模式是模型、视图、控制器开发模式 所有的View都是视图层，应该独立与模型层，由视图控制层来控制。所有的用户数据都是模型层，应该独立于视图。所有的ViewController都是控制层，由他控制视图，访问模型数据。
 
 
 
 */

//
//  AppDelegate.h
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/4/18.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>


@end

