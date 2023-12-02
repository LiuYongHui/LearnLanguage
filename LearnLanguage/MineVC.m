//
//  MineVC.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/14.
//

#import "MineVC.h"
#import <YYText/YYText.h>
#import "Object.h"
#import <MapKit/MapKit.h>
#import <AFNetworking/AFNetworking.h>

@interface MineVC ()

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.grayColor;
    [self setupUI];
    [self objectTest];
    [self dispatchGroup];
}
#pragma mark UI
- (void)setupUI {
    YYLabel *label = [[YYLabel alloc] init];
    label.frame = CGRectMake(0, 0, 100, 60);
    label.font = [UIFont systemFontOfSize:14];
    label.text =@"发现";
    label.textColor = UIColor.cyanColor;
    label.textAlignment = NSTextAlignmentLeft;
    label.lineBreakMode = NSLineBreakByTruncatingTail;
    label.backgroundColor = [UIColor blueColor];
    [self.view addSubview:label];

}
#pragma mark -
- (void)objectTest {
    Object *ob = [[Object alloc] init];
    ob.name = @"lyh";
    Object *ob1 = ob;
    NSLog(@"name = %@",ob1.name);
    ob1.name = @"change lyh";
    NSLog(@"name = %@",ob.name);
}

#pragma mark - group
- (void)dispatchGroup {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        NSLog(@"异步第一步");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"异步第二步");
    });
    dispatch_group_async(group, queue, ^{
        NSLog(@"异步第三步");
    });
    dispatch_group_notify(group, queue, ^{
        NSLog(@"最后执行");
    });
}

#pragma mark - touch
//触摸事件，开始触摸时调用，只调用一次
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"事件的属性 有几个事件%d",(int)touches.count);
//    NSArray *touchesArray = touches.allObjects;
//    UITouch *currentTouch = touchesArray[0];
//    NSLog(@"产生事件的窗口%@",currentTouch.window);
//    [self urlSessionRequest];
    [self semaphoreTest];
}


//触摸事件，开始移动时调用，会调用多次
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

//触摸事件，在结束时调用，会调用一次
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

//触摸事件，在系统事件（来电话）打断，
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark - request
- (void)urlSessionRequest {
    NSURL *url = [NSURL URLWithString:@"https://gc.ditu.aliyun.com/geocoding?a=苏州市"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:1000];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[NSData data]];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"data=%@ response=%@",data,response);
    }];
    [task resume];
    
}

#pragma mark - semaphore

- (void)semaphoreTest {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"开始===A");
        [self loadListMenuWithFinishMark:@"A"];
        NSLog(@"开始===B");
        [self loadListMenuWithFinishMark:@"B"];
        NSLog(@"开始===C");
        [self loadListMenuWithFinishMark:@"C"];
    });
}
- (void)loadListMenuWithFinishMark:(NSString *)mark {
    //创建信号量
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    NSString *urlString = @"http://www.qubaobei.com/ios/cf/dish_list.php?stage_id=1&limit=20&page=1";
    [[AFHTTPSessionManager manager] GET:urlString parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       //发送信号
        dispatch_semaphore_signal(sema);
        NSLog(@"结束====%@,objce=%@",mark,responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //发送信号
         dispatch_semaphore_signal(sema);
         NSLog(@"结束====%@ error===%@",mark,error.description);
    }];
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
}

#pragma mark - Navigation

@end
