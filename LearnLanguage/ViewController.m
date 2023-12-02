//
//  ViewController.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/4/18.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>
#import "TestClass.h"

@interface ViewController ()
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) void(^typeBlock)(BOOL selecte);
@property (nonatomic, copy) void(^cancelBlock)(void);

@property (nonatomic, copy, readwrite) NSString *cityName;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self multiThreading];
//    [self changeTwoNumber];
    self.cityName = @"北京";
//初始化的时候调用initialize类方法
//    TestClass *test = [[TestClass alloc] init];
//    TestClass *test2 = [[TestClass alloc] init];
}

/*用NSOperationQueue处理A，B，C三个线程，要求执行完A，B后才能执行C*/
- (void)multiThreading {
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    NSOperation *a = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSOperation A");
    }];
    NSOperation *b = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSOperation B");
    }];
    NSOperation *c = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"NSOperation C");
    }];
    //添加依赖
    [c addDependency:a];
    [c addDependency:b];
    //执行操作
    [queue addOperation:a];
    [queue addOperation:b];
    [queue addOperation:c];
}

/*不用中间变量，用两种方法交换A和B的值*/
- (void)changeTwoNumber {
    int A = 20,B = 30;
    A = A + B;//A=50 B=30
    B = A - B;//A=50 B=20
    A = A -B;//A=30 B=20
    printf("A=%d B=%d\n",A,B);
    
    int C = 40, D = 50;
    C = C ^ D;
    D = C ^ D;
    C = C ^ D;
    printf("C=%d D=%d\n",C,D);
}


@end
