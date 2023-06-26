//
//  DDCollegePickerVC.h
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/6/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class DDCollegePickerVC;
@protocol DDCollegePickerVCDelegate <NSObject>

- (void)didSelectedCollegePicker:(DDCollegePickerVC *)picker
                       collegeID:(NSString *)collegeID
                     collegeName:(NSString *)collegeName;

@end


@interface DDCollegePickerVC : UIViewController

@property (nonatomic, weak) id<DDCollegePickerVCDelegate> delegate;
@property (nonatomic, weak) UIView *inputView;

@end

NS_ASSUME_NONNULL_END
