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
浅复制和深复制区别：浅复制只复制指向对象的指针，而不复制引用对象本身。深层复制复制引用对象本身，内存中存在两份独立对象本身。
代理的作用：是改变或传递控制链。允许一个类在某些特定时刻通知到其他类，而不需要获取到那些类的指针。
 OC是动态运行时语言是指：多态，主要是将数据类型的确定由编译时推迟到运行时。运行时和多态。
 运行时机制使我们直到运行时才去决定一个对象的类别，以及调用该类别对象指定方法。
多态：不同对象以自己的方式响应相同的消息的能力叫做多态。
 通知和协议的不同之处：协议有控制链的关系，通知没有。通知可以一对多。
 推送通知是一种技术。是客户端获取资源的一种手段。
 事件响应链处理。
 懒加载模式只在用到的时候才去初始化，也可以理解成延时加载。延时加载避免内存过高，异步加载避免线程阻塞。
 什么时候使用NSMutableArray，什么时候使用NSArray？在程序运行时，需要不断变化的使用NSMutableArray，当数组在初始化后不再改变的使用NSArray。使用NSArray只表明的是该数组在运行时不发生改变，即不能往NSArray的数组里新增和删除元素，但不表明其数组内的元素的内容不能发生改变。NSArray是线程安全的，NSMutableArray不是安全线程。
 在应用中可以创建无数个autorelease对象。
 iOS应用保存数据机制：1、服务器 2、NSCoder固化机制，将对象保存在文件中 3、使用SQlite或CoreData保存在文件数据库中 4、NSUserDefaults
 多线程：最初的理解就是并发。GCD是从系统级别提供的一个易用多线程类库。具有运行时的特点，能充分利用多核心硬件。
 NSThread是一个抽象类，它封装了线程的实现细节。
 项目中使用GCD的优点是GCD本身简单，易用，对不不复杂的多线程操作，会节省代码量，而Block参数的使用，会是代码更为易读，建议在简单项目中使用。
 
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

