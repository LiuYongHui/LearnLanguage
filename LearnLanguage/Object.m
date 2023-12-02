//
//  Object.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/7/10.
//

#import "Object.h"

@implementation Object
static Object *ob;
+ (Object *)shareObject {
    if(ob == nil){
        @synchronized (self) {
            ob = [[Object alloc] init];
        }
    }
    return ob;
}
- (instancetype)init {
    self = [super init];
    if (self) {
        NSLog(@"%@",NSStringFromClass([self class]));
        NSLog(@"%@",NSStringFromClass([super class]));
    }
    return self;
}


@end
