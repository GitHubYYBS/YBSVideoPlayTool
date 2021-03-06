//
//  UIView+CustomControlView.m
//


#import "UIView+CustomControlView.h"
#import <objc/runtime.h>

@implementation UIView (CustomControlView)

- (void)setDelegate:(id<YBSPlayerControlViewDelagate>)delegate {
    objc_setAssociatedObject(self, @selector(delegate), delegate, OBJC_ASSOCIATION_ASSIGN);
}

- (id<YBSPlayerControlViewDelagate>)delegate {
   return objc_getAssociatedObject(self, _cmd);
}

/** 
 * 设置播放模型 
 */
- (void)ybs_playerModel:(YBSPlayerModel *)playerModel {}

- (void)ybs_playerShowOrHideControlView {}
/**
 * 显示top、bottom、lockBtn
 */
- (void)ybs_playerShowControlView {}
/**
 * 隐藏top、bottom、lockBtn*/
- (void)ybs_playerHideControlView {}

/**
 * 重置ControlView
 */
- (void)ybs_playerResetControlView {}


/**
 * 取消自动隐藏控制层view
 */
- (void)ybs_playerCancelAutoFadeOutControlView {}

/**
 * 开始播放（隐藏placeholderImageView）
 */
- (void)ybs_playerItemPlaying {}

/**
 * 播放完了
 */
- (void)ybs_playerPlayEnd {}


/**
 * 下载按钮状态
 */
- (void)ybs_playerDownloadBtnState:(BOOL)state {}



/**
 * 播放按钮状态 (播放、暂停状态)
 */
- (void)ybs_playerPlayBtnState:(BOOL)state {}

/**
 * 锁定屏幕方向按钮状态
 */
- (void)ybs_playerLockBtnState:(BOOL)state {}

/**
 * 加载的菊花
 */
- (void)ybs_playerActivity:(BOOL)animated {}

/**
 * 设置预览图
 
 * @param draggedTime 拖拽的时长
 * @param image       预览图
 */
- (void)ybs_playerDraggedTime:(NSInteger)draggedTime sliderImage:(UIImage *)image {}

/**
 * 拖拽快进 快退
 
 * @param draggedTime 拖拽的时长
 * @param totalTime   视频总时长
 * @param forawrd     是否是快进
 * @param preview     是否有预览图
 */
- (void)ybs_playerDraggedTime:(NSInteger)draggedTime totalTime:(NSInteger)totalTime isForward:(BOOL)forawrd hasPreview:(BOOL)preview {}

/**
 * 滑动调整进度结束结束
 */
- (void)ybs_playerDraggedEnd {}

/**
 * 正常播放
 
 * @param currentTime 当前播放时长
 * @param totalTime   视频总时长
 * @param value       slider的value(0.0~1.0)
 */
- (void)ybs_playerCurrentTime:(NSInteger)currentTime totalTime:(NSInteger)totalTime sliderValue:(CGFloat)value {}

/**
 * progress显示缓冲进度
 */
- (void)ybs_playerSetProgress:(CGFloat)progress {}

/**
 * 视频加载失败
 */
- (void)ybs_playerItemStatusFailed:(NSError *)error {}

/**
 * 小屏播放
 */
- (void)ybs_playerBottomShrinkPlay {}

/**
 * 在cell播放
 */
- (void)ybs_playerCellPlay {}

@end
