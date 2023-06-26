//
//  TestClass.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/13.
//

#import "TestClass.h"

@implementation TestClass

+ (void)load {
    NSLog(@"load===%@",[NSDate date]);
}

+ (void)initialize {
    NSLog(@"initialize===%@",[NSDate date]);
}


@end
