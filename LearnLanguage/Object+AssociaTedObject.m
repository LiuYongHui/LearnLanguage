//
//  Object+AssociaTedObject.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/12/2.
//

#import "Object+AssociaTedObject.h"
#import <objc/runtime.h>

@implementation Object (AssociaTedObject)

- (void)setAssociatedObject:(id)associatedObject {
    objc_setAssociatedObject(self, @selector(associatedObject), associatedObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (id)associatedObject {
    return objc_getAssociatedObject(self, @selector(associatedObject));
}



@end
