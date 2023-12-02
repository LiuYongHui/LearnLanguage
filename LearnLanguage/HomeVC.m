//
//  HomeVC.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/14.
//

#import "HomeVC.h"
#import "UIColor+YHUIColor.h"
#import "CalculatorViewController.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"#66BF22"];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CalculatorViewController *calculatorVC = [[CalculatorViewController alloc] init];
    [self presentViewController:calculatorVC animated:YES completion:^{
            
    }];
}

@end
