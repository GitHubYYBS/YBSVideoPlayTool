//
//  YBSPlayerModel.h


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YBSPlayerModel : NSObject

/** 视频标题 */
@property (nonatomic, copy) NSString     *title;
/** 视频URL */
@property (nonatomic, strong) NSURL        *videoURL;
/** 视频封面本地图片 */
@property (nonatomic, strong) UIImage      *placeholderImage;
/** 播放器View的父视图*/
@property (nonatomic, weak) UIView       *fatherView;
/** 视频封面网络图片url -> 如果和本地图片同时设置，则忽略本地图片，显示网络图片 */
@property (nonatomic, copy) NSString     *placeholderImageURLString;
/** 从xx秒开始播放视频(默认0) */
@property (nonatomic, assign) NSInteger    seekTime;



@end
