//
//  ViewController.m
//  YBSVideoPlayTool
//
//  Created by 严兵胜 on 2018/7/3.
//  Copyright © 2018年 严兵胜. All rights reserved.
//

#import "ViewController.h"


#import "YBSPlayerView.h"
#import "YBSPlayerControlView.h"
#import "YBSPlayerModel.h"



#import "UIView+Frame.h"




/**  尺寸 */
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


/** 弱引用 */
#define FSXWeakSelf __weak typeof(self) weakSelf = self;

@interface ViewController ()<YBSPlayerDelegate>

@property (nonatomic, weak) YBSPlayerView *player;
@property (nonatomic, strong) YBSPlayerModel *playerModel;
@property (nonatomic, strong) YBSPlayerControlView *controlView;
@property (nonatomic, weak) UIView *playerFatherView;
@property (nonatomic, assign,getter=isFullScreenBool) BOOL fullScreenBool;

@property (nonatomic, weak) UIView *stateBagView;



/** 离开页面时候是否在播放 */
@property (nonatomic, assign) BOOL isPlaying;

@end

@implementation ViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (self.player && self.isPlaying) {
        self.isPlaying = NO;
        self.player.playerPushedOrPresented = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (self.player && !self.player.isPauseByUser){
        self.isPlaying = YES;
        self.player.playerPushedOrPresented = YES;
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *stateBagView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    stateBagView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_stateBagView = stateBagView];
    
    UIView *playerFatherView = [[UIView alloc] initWithFrame:CGRectMake(0, stateBagView.bottom, SCREEN_WIDTH, SCREEN_WIDTH * 9 / 16)];
    [self.view addSubview:_playerFatherView = playerFatherView];
    playerFatherView.backgroundColor = [UIColor redColor];
    
    
    
    
    UIView *textView = [UIView new];
    textView.backgroundColor = [UIColor redColor];
    textView.top = playerFatherView.bottom + 20;
    textView.centerX = SCREEN_WIDTH * 0.5;
    textView.size = CGSizeMake(100, 100);
    [self.view insertSubview:textView belowSubview:playerFatherView];
    
    
    
    
    
    // 自动播放，默认不自动播放
//    [self.player autoPlayTheVideo];
}

#pragma mark - YBSPlayerDelegate

// 返回值要必须为NO
- (BOOL)shouldAutorotate {
    return false;
}

// 点击了 左上角  返回按钮 
- (void)ybs_playerBackAction{
    
    if (self.controlView.fullScreenBtn.selected) {
        [self portraitScreen];
        self.controlView.fullScreenBtn.selected = self.fullScreenBool = false;
    }else{
        [self.player pause];
        [self.navigationController popViewControllerAnimated:true];
    }
    
}


- (void)ybs_playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime{
    
//    NSLog(@"已播放(s)currentTime = %ld__总时长(s)totalTime = %ld",(long)currentTime,(long)totalTime);
    
}


/** 全屏按钮事件 */
- (void)ybs_controlView:(UIView *)controlView fullScreenAction:(UIButton *)sender{
    
    if (sender.selected) { // 横屏
        [self tofullScreen];
        self.fullScreenBool = true;
        
    }else{ // 竖屏
        [self portraitScreen];
        self.fullScreenBool = false;
        
    }
}



#pragma mark - 其他

/// 关于屏幕
- (void)tofullScreen{ // home在右
    
    FSXWeakSelf
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationLandscapeRight animated:false];
//    [[UIApplication sharedApplication] setStatusBarHidden:true];
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.playerFatherView.transform = CGAffineTransformMakeRotation(M_PI/2);
        weakSelf.playerFatherView.frame = CGRectMake(0,0, SCREEN_HEIGHT, SCREEN_WIDTH);
        weakSelf.player.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
        // 亮度
        YBSBrightnessView *brightnessView = [YBSBrightnessView sharedBrightnessView];
        brightnessView.transform = CGAffineTransformMakeRotation(M_PI/2);
        
        
        // 音量
    } completion:^(BOOL finished) {
        
    }];
    
}

// 竖屏
- (void)portraitScreen{
    
    FSXWeakSelf
    [[UIApplication sharedApplication] setStatusBarOrientation:UIInterfaceOrientationPortrait animated:NO];
//    [[UIApplication sharedApplication] setStatusBarHidden:false];
    [UIView animateWithDuration:0.3 animations:^{
        weakSelf.playerFatherView.transform = CGAffineTransformMakeRotation(M_PI * 2);
        weakSelf.playerFatherView.frame = CGRectMake(0,self->_stateBagView.bottom, SCREEN_WIDTH, SCREEN_WIDTH * 9 / 16.0);
        weakSelf.player.frame = CGRectMake(0, 0, SCREEN_WIDTH, self->_playerFatherView.height);
        
        
        // 亮度
        YBSBrightnessView *brightnessView = [YBSBrightnessView sharedBrightnessView];
        brightnessView.transform = CGAffineTransformMakeRotation(2 * M_PI);
        
        // 音量
        weakSelf.player.volumeViewSlider.transform = CGAffineTransformMakeRotation(2 * M_PI);
        
    } completion:^(BOOL finished) {
        
    }];
    
}


#pragma mark - Lazy loading

- (YBSPlayerModel *)playerModel{
    
    if (!_playerModel) {
        _playerModel = [[YBSPlayerModel alloc] init];
        _playerModel.title = @"标题标题标题标题标题标题";
        
        //1.从mainBundle获取test.mp4的具体路径
        NSString * path = [[NSBundle mainBundle] pathForResource:@"introduce2" ofType:@"mp4"];
        //2.文件的url
        NSURL *videoURL = [NSURL fileURLWithPath:path];
        _playerModel.videoURL = videoURL; //[NSURL URLWithString:@"http://static.smartisanos.cn/common/video/proud-farmer.mp4"];
        _playerModel.placeholderImageURLString = @"https://gss1.bdstatic.com/-vo3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=2115b4591d950a7b613846966bb809bc/f31fbe096b63f624067dd66c8744ebf81a4ca3b9.jpg";
        _playerModel.fatherView = self.playerFatherView;
    }
    return _playerModel;
}

- (YBSPlayerView *)player{
    
    if (!_player) {
        YBSPlayerView *player = [[YBSPlayerView alloc] init];
        [player playerControlView:_controlView = [[YBSPlayerControlView alloc] init] playerModel:self.playerModel];
        player.delegate = self;
        player.hasPreviewView = true;
        _player = player;
    }
    return _player;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
