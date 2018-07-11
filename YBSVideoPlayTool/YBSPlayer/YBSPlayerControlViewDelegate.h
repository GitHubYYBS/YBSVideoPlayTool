

#ifndef YBSPlayerControlViewDelegate_h
#define YBSPlayerControlViewDelegate_h


#endif /* YBSPlayerControlViewDelegate_h */

@protocol YBSPlayerControlViewDelagate <NSObject>

@optional
/** 返回按钮事件 */
- (void)ybs_controlView:(UIView *)controlView backAction:(UIButton *)sender;
/** cell播放中小屏状态 关闭按钮事件 */
- (void)ybs_controlView:(UIView *)controlView closeAction:(UIButton *)sender;
/** 播放按钮事件 */
- (void)ybs_controlView:(UIView *)controlView playAction:(UIButton *)sender;
/** 全屏按钮事件 */
- (void)ybs_controlView:(UIView *)controlView fullScreenAction:(UIButton *)sender;
/** 锁定屏幕方向按钮时间 */
- (void)ybs_controlView:(UIView *)controlView lockScreenAction:(UIButton *)sender;
/** 重播按钮事件 */
- (void)ybs_controlView:(UIView *)controlView repeatPlayAction:(UIButton *)sender;
/** 中间播放按钮事件 */
- (void)ybs_controlView:(UIView *)controlView cneterPlayAction:(UIButton *)sender;
/** 加载失败按钮事件 */
- (void)ybs_controlView:(UIView *)controlView failAction:(UIButton *)sender;
/** slider的点击事件（点击slider控制进度） */
- (void)ybs_controlView:(UIView *)controlView progressSliderTap:(CGFloat)value;
/** 开始触摸slider */
- (void)ybs_controlView:(UIView *)controlView progressSliderTouchBegan:(UISlider *)slider;
/** slider触摸中 */
- (void)ybs_controlView:(UIView *)controlView progressSliderValueChanged:(UISlider *)slider;
/** slider触摸结束 */
- (void)ybs_controlView:(UIView *)controlView progressSliderTouchEnded:(UISlider *)slider;
/** 控制层即将显示 */
- (void)ybs_controlViewWillShow:(UIView *)controlView isFullscreen:(BOOL)fullscreen;
/** 控制层即将隐藏 */
- (void)ybs_controlViewWillHidden:(UIView *)controlView isFullscreen:(BOOL)fullscreen;

@end
