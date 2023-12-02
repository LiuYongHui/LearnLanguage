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
 只在主线程刷新访问UI，为了防止资源抢夺，可用synchronized进行加锁保护
 GCD的执行速度比NSOperationQueue快。
 任务之间不太相互依赖使用GCD
 任务之间有依赖或者要监听任务的执行情况使用NSOperationQueue
 KVO是基于runtime机制实现的
 如果在异步线程发的通知，那么可以执行比较耗时的操作；如果在主线程发的通知，那么就不可以执行比较耗时的操作。
 
 客户端的缓存机制：内存数据缓存、数据库缓存、文件缓存
 
 控制器的生命周期及相关函数
 1、首先判断控制器是否有视图，如果没有就调用loadView方法创建
 2、随后调用viewDidLoad，可以进行下一步的初始化操作；只会被调用一次；
 3、在视图显示之前调用viewWillAppear；该函数可以多次调用；
 4、视图viewDidAppear
 5、在视图显示之前调用viewWillDisappear；该函数可以多次调用；
 6、在布局变化前后，调用viewWill/DidLayoutSubviews处理相关信息
 
 
 NSRunLoop是iOS消息机制的处理模式
 1、NSRunLoop的主要作用：控制NSRunLoop里面线程的执行与休眠
 
 MRC和ARC都可以使用copy
 注意循环引用造成的内存泄漏
 strong表示对对象的强引用
 两个对象之间相互强引用造成循环引用，内存泄漏。
 nonatomic 特点是多线程并发访问性能高 直接访问内存中的地址，不关心其他线程是否在改变这个值，中间没有死锁保护。
 浅拷贝：对于被复制对象的每一层都是指针复制。
 深拷贝：对于被复制对象，至少有一层是深复制。
 完全拷贝：对于被复制对象，每一层都是对象复制
 自定义对象的拷贝都是深拷贝
 实例变量存储在结构中
 对象实际上是结构，结构中的成员是实例变量
 isa指针确定对象所属的类。
 对象变量实际是指针  方法是函数 消息表达式是函数调用    id类型是通用指针类型
 内存管理：自动垃圾收集 手工引用计数和自动释放池 自动引用计数
 自动释放池不包含对象，只包含对象的引用。
 ARC 编译器管理
 
主队列 全局队列 自定义队列
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

