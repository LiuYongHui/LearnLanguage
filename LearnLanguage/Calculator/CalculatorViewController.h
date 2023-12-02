//
//  CalculatorViewController.h
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/11/3.
//

#import <UIKit/UIKit.h>
#import "CalcutorModel.h"
#import <AVFoundation/AVFoundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorViewController : UIViewController

@property (strong, nonatomic) CalcutorModel *model;
//结果标签
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
//操作符
@property (nonatomic, copy, nullable) NSString *currentOperator;
//数字按钮被按下
- (IBAction)digitPress:(id)sender;
//操作符被按下
- (IBAction)opertorPress:(id)sender;
//结果按钮被按下
- (IBAction)resultPress:(id)sender;
//清除按钮被按下
- (IBAction)cleanPress:(id)sender;
- (IBAction)paly:(id)sender;

- (IBAction)stop:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *mySlider;
@property (nonatomic, strong) AVAudioPlayer *myPlayer;
@property (nonatomic, strong) AVAudioRecorder *myRecorder;


- (IBAction)recorderStart:(id)sender;
- (IBAction)recorderStop:(id)sender;
- (IBAction)recorderPlay:(id)sender;


@end

NS_ASSUME_NONNULL_END
