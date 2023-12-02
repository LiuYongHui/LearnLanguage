//
//  DrawView.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/11/11.
//

#import "DrawView.h"

@implementation DrawView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextRef, 2);
    CGContextSetStrokeColorWithColor(contextRef, UIColor.redColor.CGColor);
    CGContextMoveToPoint(contextRef, self.startPoint.x, self.startPoint.y);
    CGContextAddLineToPoint(contextRef, self.endPoint.x, self.endPoint.y);
    CGContextStrokePath(contextRef);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
    self.endPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.endPoint = [touch locationInView:self];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.endPoint = [touch locationInView:self];
    [self setNeedsDisplay];
}

@end
