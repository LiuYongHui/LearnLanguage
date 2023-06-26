//
//  NSString+YHNSString.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/25.
//

#import "NSString+YHNSString.h"

@implementation NSString (YHNSString)
- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}
@end
