//
//  YBSPlayerView.h



#import <UIKit/UIKit.h>
#import "YBSPlayer.h"
#import "YBSPlayerModel.h"
#import "YBSPlayerControlViewDelegate.h"





#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "UIView+CustomControlView.h"
#import "YBSBrightnessView.h"

#define CellPlayerFatherViewTag  200

//忽略编译器的警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"


@class YBSPlayerControlView;
// 枚举值，包含水平移动方向和垂直移动方向
typedef NS_ENUM(NSInteger, PanDirection){
    PanDirectionHorizontalMoved, // 横向移动
    PanDirectionVerticalMoved    // 纵向移动
};


// playerLayer的填充模式（默认：等比例填充，直到一个维度到达区域边界）
typedef NS_ENUM(NSInteger, YBSPlayerLayerGravity) {
    YBSPlayerLayerGravityResize,           // 非均匀模式。两个维度完全填充至整个视图区域
    YBSPlayerLayerGravityResizeAspect,     // 等比例填充，直到一个维度到达区域边界
    YBSPlayerLayerGravityResizeAspectFill  // 等比例填充，直到填充满整个视图区域，其中一个维度的部分区域会被裁剪
};

// 播放器的几种状态
typedef NS_ENUM(NSInteger, YBSPlayerState) {
    YBSPlayerStateFailed,     // 播放失败
    YBSPlayerStateBuffering,  // 缓冲中
    YBSPlayerStatePlaying,    // 播放中
    YBSPlayerStateStopped,    // 停止播放
    YBSPlayerStatePause       // 暂停播放
};







@protocol YBSPlayerDelegate <NSObject>
@optional
/** 返回按钮事件 */
- (void)ybs_playerBackAction;
/** 控制层即将显示 */
- (void)ybs_playerControlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen;
/** 控制层即将隐藏 */
- (void)ybs_playerControlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen;
/** 全屏按钮事件 */
- (void)ybs_controlView:(UIView *)controlView fullScreenAction:(UIButton *)sender; // 自己添加的
/**
 * 正常播放
 
 * @param currentTime 当前播放时长
 * @param totalTime   视频总时长
 */
- (void)ybs_playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime;


@end




@interface YBSPlayerView : UIView <YBSPlayerControlViewDelagate>

/** 设置playerLayer的填充模式 */
@property (nonatomic, assign) YBSPlayerLayerGravity    playerLayerGravity;
/** 是否有下载功能(默认是关闭) */
@property (nonatomic, assign) BOOL                    hasDownload;
/** 是否开启预览图 */
@property (nonatomic, assign) BOOL                    hasPreviewView;
/** 设置代理 */
@property (nonatomic, weak) id<YBSPlayerDelegate>      delegate;
/** 是否被用户暂停 */
@property (nonatomic, assign) BOOL          isPauseByUser;
/** 播发器的几种状态 */
@property (nonatomic, assign) YBSPlayerState state;
/** 静音（默认为NO）*/
@property (nonatomic, assign) BOOL                    mute;
/** 当cell划出屏幕的时候停止播放（默认为NO） */
@property (nonatomic, assign) BOOL                    stopPlayWhileCellNotVisable;
/** 当cell播放视频由全屏变为小屏时候，是否回到中间位置(默认YES) */
@property (nonatomic, assign) BOOL                    cellPlayerOnCenter;
/** player在栈上，即此时push或者模态了新控制器 */
@property (nonatomic, assign) BOOL                    playerPushedOrPresented;






/** 播放属性 */
@property (nonatomic, strong) AVPlayer               *player;
@property (nonatomic, strong) AVPlayerItem           *playerItem;
@property (nonatomic, strong) AVURLAsset             *urlAsset;
@property (nonatomic, strong) AVAssetImageGenerator  *imageGenerator;
/** playerLayer */
@property (nonatomic, strong) AVPlayerLayer          *playerLayer;
@property (nonatomic, strong) id                     timeObserve;
/** 滑杆 */
@property (nonatomic, strong) UISlider               *volumeViewSlider;
/** 用来保存快进的总时长 */
@property (nonatomic, assign) CGFloat                sumTime;
/** 定义一个实例变量，保存枚举值 */
@property (nonatomic, assign) PanDirection           panDirection;

/** 是否为全屏 */
@property (nonatomic, assign) BOOL                   isFullScreen;
/** 是否锁定屏幕方向 */
@property (nonatomic, assign) BOOL                   isLocked;
/** 是否在调节音量*/
@property (nonatomic, assign) BOOL                   isVolume;

/** 是否播放本地文件 */
@property (nonatomic, assign) BOOL                   isLocalVideo;
/** slider上次的值 */
@property (nonatomic, assign) CGFloat                sliderLastValue;
/** 是否再次设置URL播放视频 */
@property (nonatomic, assign) BOOL                   repeatToPlay;
/** 播放完了*/
@property (nonatomic, assign) BOOL                   playDidEnd;
/** 进入后台*/
@property (nonatomic, assign) BOOL                   didEnterBackground;
/** 是否自动播放 */
@property (nonatomic, assign) BOOL                   isAutoPlay;
/** 单击 */
@property (nonatomic, strong) UITapGestureRecognizer *singleTap;
/** 双击 */
@property (nonatomic, strong) UITapGestureRecognizer *doubleTap;
/** 视频URL的数组 */
@property (nonatomic, strong) NSArray                *videoURLArray;
/** slider预览图 */
@property (nonatomic, strong) UIImage                *thumbImg;
/** 亮度view */
@property (nonatomic, strong) YBSBrightnessView       *brightnessView;
/** 视频填充模式 */
@property (nonatomic, copy) NSString                 *videoGravity;

#pragma mark - UITableViewCell PlayerView

/** 是否正在拖拽 */
@property (nonatomic, assign) BOOL                   isDragged;
/** 小窗口距屏幕右边和下边的距离 */
@property (nonatomic, assign) CGPoint                shrinkRightBottomPoint;

@property (nonatomic, strong) UIPanGestureRecognizer *shrinkPanGesture;

@property (nonatomic, strong) YBSPlayerControlView    *ybs_controlView;
@property (nonatomic, strong) YBSPlayerModel          *playerModel;
@property (nonatomic, assign) NSInteger              seekTime;
@property (nonatomic, strong) NSURL                  *videoURL;
@property (nonatomic, strong) NSDictionary           *resolutionDic;



/**
 * 指定播放的控制层和模型
 * 控制层传nil，默认使用YBSPlayerControlView(如自定义可传自定义的控制层)
 */
- (void)playerControlView:(UIView *)controlView playerModel:(YBSPlayerModel *)playerModel;

/**
 * 使用自带的控制层时候可使用此API
 */
- (void)playerModel:(YBSPlayerModel *)playerModel;

/**
 *  自动播放，默认不自动播放
 */
- (void)autoPlayTheVideo;

/**
 *  重置player
 */
- (void)resetPlayer;

/**
 *  在当前页面，设置新的视频时候调用此方法
 */
- (void)resetToPlayNewVideo:(YBSPlayerModel *)playerModel;

/**
 *  播放
 */
- (void)play;

/**
  * 暂停
 */
- (void)pause;

@end
