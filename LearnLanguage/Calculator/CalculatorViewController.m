//
//  CalculatorViewController.m
//  LearnLanguage
//
//  Created by 刘永慧 on 2023/11/3.
//

#import "CalculatorViewController.h"
#import "RedView.h"
#import "DrawView.h"
@interface CalculatorViewController ()<AVAudioPlayerDelegate>



@end

@implementation CalculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    RedView *redView = [[RedView alloc] initWithFrame:CGRectMake(0, 400, 200, 200)];
    redView.backgroundColor = UIColor.purpleColor;
    [self.view addSubview:redView];
    DrawView *drawView = [[DrawView alloc] initWithFrame:CGRectMake(200, 400, 300, 300)];
    drawView.backgroundColor = UIColor.lightGrayColor;
    [self.view addSubview:drawView];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"]];
    self.myPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    self.myPlayer.delegate = self;
    
    
    NSArray *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docPath = [dirPath objectAtIndex:0];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"test1.wav"];
    NSURL *soundFileURL = [NSURL fileURLWithPath:filePath];
    NSDictionary *recordSetting = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:AVAudioQualityMin],AVEncoderAudioQualityKey,[NSNumber numberWithInt:16],AVEncoderBitRateKey,[NSNumber numberWithInt:2],AVNumberOfChannelsKey,[NSNumber numberWithFloat:44100.00],AVSampleRateKey, nil];
    NSError *error;
    self.myPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileURL error:nil];
    self.myRecorder = [[AVAudioRecorder alloc] initWithURL:soundFileURL settings:recordSetting error:&error];
    
    if(error){
        NSLog(@"%@",[error localizedDescription]);
    }else{
        [self.myRecorder prepareToRecord];
    }
}


- (IBAction)digitPress:(id)sender {
    UIButton *btn = (UIButton *)sender;
    double num = btn.titleLabel.text.doubleValue;
    
    if(self.currentOperator == nil){
        self.model.result = num;
    }
    [self.model calcute:num andOperator:self.currentOperator];
}
//操作符按下
- (IBAction)opertorPress:(id)sender {
    UIButton *btn = (UIButton *)sender;
    self.currentOperator = btn.titleLabel.text;
}

//结果按钮被按下
- (IBAction)resultPress:(id)sender {
    self.resultLabel.text = [NSString stringWithFormat:@"%.2f",self.model.result];
    self.model.result = 0.0;
    self.currentOperator = nil;
}
//清除按钮被按下
- (IBAction)stop:(id)sender {
    if(self.myPlayer != nil){
        [self.myPlayer stop];
    }
}
- (IBAction)change:(id)sender {
    NSLog(@"max = %.2f",self.mySlider.value);
    if(self.myPlayer != nil){
        self.myPlayer.volume = self.mySlider.value;

    }
}

- (IBAction)paly:(id)sender {
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test" ofType:@"mp3"]];
    self.myPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    if(self.myPlayer != nil){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self.myPlayer play];
        });
    }
}

#pragma mark - delegate
//音乐被中断
- (void)audioPlayerBeginInterruption:(AVAudioPlayer *)player {
    NSLog(@"打来电话导致音乐中断");
}

//继续播放
- (void)audioPlayerEndInterruption:(AVAudioPlayer *)player withOptions:(NSUInteger)flags {
    if(flags == AVAudioSessionInterruptionFlags_ShouldResume && player != nil){
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self.myPlayer play];
        });
    }
}

- (IBAction)cleanPress:(id)sender {
    self.resultLabel.text = @"0.0";
    self.model.result = 0.0;
    self.currentOperator = nil;
}

- (CalcutorModel *)model {
    if(!_model) {
        _model = [[CalcutorModel alloc] init];
    }
    return _model;
}


- (IBAction)recorderStart:(id)sender {
    if(!self.myRecorder){
        [self.myRecorder record];
    }
}

- (IBAction)recorderStop:(id)sender {
    [self.myRecorder stop];
}

- (IBAction)recorderPlay:(id)sender {
    self.myPlayer.volume = 1;
    [self.myPlayer play];
}
@end
