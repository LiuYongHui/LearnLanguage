//
//  DiscoverVC.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/14.
//

#import "DiscoverVC.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import <WebKit/WebKit.h>

@interface DiscoverVC ()

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, copy) NSString *html;

@end

@implementation DiscoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.greenColor;
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"2");
    });
    NSLog(@"3");
    
    [self getData];
    [self.view addSubview:self.webView];
    NSString *str = @"https://www.apple.com";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webView loadRequest:request];
}

//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.mode = MBProgressHUDModeDeterminate;
//    hud.label.text = @"Loading";
//    [self performSelector:@selector(hidHUD) withObject:nil afterDelay:6];
//}


- (void)hidHUD {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self hidHUD];

}

- (void)getData {
    NSString *str = @"https://www.apple.com";
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    NSURLSession *session = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
   
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURLSessionDataTask *task =  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
              if(data.length > 0){
                 self.html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                  [self.webView loadHTMLString:self.html baseURL:nil];
              }else{
                  NSLog(@"%@",error.description);
              }
          }];
          [task resume];
    });

}
 
- (WKWebView *)webView {
    if(!_webView){
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame];
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan:withEvent:)];
        [_webView addGestureRecognizer:tap];
    }
    return _webView;
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
