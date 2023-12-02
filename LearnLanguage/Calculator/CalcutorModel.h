//
//  CalcutorModel.h
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/11/3.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalcutorModel : NSObject

@property (nonatomic) double result;

- (double)calcute:(double)num andOperator:(NSString *)ope;

@end

NS_ASSUME_NONNULL_END
