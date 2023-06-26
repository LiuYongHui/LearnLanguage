//
//  UIColor+YHUIColor.h
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YHUIColor)
//十六进制字符串转颜色色值
+ (instancetype)colorWithHexString:(NSString *)hexStr;
@end

NS_ASSUME_NONNULL_END
