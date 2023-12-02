//
//  RedView.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/11/3.
//

#import "RedView.h"

@implementation RedView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGRect r = CGRectMake(20, 20, 100, 100);
    CGContextAddRect(context, r);
    CGContextDrawPath(context, kCGPathFill);
}


@end
