//
//  UIColor+YHUIColor.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/25.
//

#import "UIColor+YHUIColor.h"
#import "NSString+YHNSString.h"

@implementation UIColor (YHUIColor)
+ (instancetype)colorWithHexString:(NSString *)hexStr {
    CGFloat r, g, b, a;
    if(hexStrToRGB(hexStr, &r, &g, &b, &a)){
        return [UIColor colorWithRed:r green:g blue:b alpha:a];
    }
    return nil;
}

static BOOL hexStrToRGB(NSString *str, CGFloat *r, CGFloat *g, CGFloat *b, CGFloat *a) {
    str = [[str stringByTrim] uppercaseString];
    if([str hasPrefix:@"#"]){
        str = [str substringFromIndex:1];
    }else if([str hasPrefix:@"0x"]){
        str = [str substringFromIndex:2];
    }
    NSUInteger length = [str length];
    if(length != 3 && length != 4 && length != 6 && length != 8){
        return NO;
    }
    
    if(length < 5){
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 1)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(1, 1)]) / 255.0f;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(2, 1)]) / 255.0f;
        if(length == 4){
            *a = hexStrToInt([str substringWithRange:NSMakeRange(3, 1)]) / 255.0;
        }else{
            *a = 1;
        }
    }else{
        *r = hexStrToInt([str substringWithRange:NSMakeRange(0, 2)]) / 255.0f;
        *g = hexStrToInt([str substringWithRange:NSMakeRange(2, 2)]) / 255.0;
        *b = hexStrToInt([str substringWithRange:NSMakeRange(4, 2)]) / 255.0f;
        if(length == 8){
            *a = hexStrToInt([str substringWithRange:NSMakeRange(6, 2)]) / 255.0f;
        }else{
            *a = 1;
        }
    }
    return YES;
}

static inline NSUInteger hexStrToInt(NSString *str){
    uint32_t result = 0;
    sscanf([str UTF8String], "%X",&result);
    return result;
}

@end
