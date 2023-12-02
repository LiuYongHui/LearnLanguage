//
//  CalcutorModel.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/11/3.
//

#import "CalcutorModel.h"

@implementation CalcutorModel

- (double)calcute:(double)num andOperator:(NSString *)ope {
    if([ope isEqualToString:@"+"]){
        self.result += num;
    }else if([ope isEqualToString:@"-"]){
        self.result -= num;
    }else if ([ope isEqualToString:@"*"]){
        self.result *= num;
    }else if ([ope isEqualToString:@"/"]){
        self.result /= num;
    }
    return self.result;
}

@end
