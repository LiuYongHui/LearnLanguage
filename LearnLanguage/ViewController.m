//
//  ViewController.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/4/18.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self threadMethod];

}


- (void)createThread {

}

- (void)threadMethod {
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runThread) object:nil];
    [thread start];

    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        
    }];
    
    

    
}

- (void)runThread {
    NSLog(@"hello %@", [NSThread currentThread]);
}



@end
