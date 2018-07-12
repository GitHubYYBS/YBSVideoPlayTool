//
//  YBSPlayer.h
//



//忽略编译器的警告
#pragma clang diagnostic push
#pragma clang diagnostic pop
#pragma clang diagnostic ignored"-Wdeprecated-declarations"


// 监听TableView的contentOffset
#define kYBSPlayerViewContentOffset          @"contentOffset"
// player的单例
#define YBSPlayerShared                      [YBSBrightnessView sharedBrightnessView]
// 屏幕的宽
#define ScreenWidth                         [[UIScreen mainScreen] bounds].size.width
// 屏幕的高
#define ScreenHeight                        [[UIScreen mainScreen] bounds].size.height
// 颜色值RGB
#define RGBA(r,g,b,a)                       [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
// 图片路径
#define YBSPlayerSrcName(file)               [@"YBSPlayer.bundle" stringByAppendingPathComponent:file]

#define YBSPlayerFrameworkSrcName(file)      [@"Frameworks/YBSPlayer.framework/YBSPlayer.bundle" stringByAppendingPathComponent:file]

#define YBSPlayerImage(file)                 [UIImage imageNamed:YBSPlayerSrcName(file)] ? :[UIImage imageNamed:YBSPlayerFrameworkSrcName(file)]



#import "YBSPlayerView.h"
#import "YBSPlayerModel.h"
#import "YBSPlayerControlView.h"
#import "YBSBrightnessView.h"
#import "UIWindow+CurrentViewController.h"
#import "YBSPlayerControlViewDelegate.h"
#import <Masonry/Masonry.h>
