//
//  UIImageView+YBSWebCache.m
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/5/9.
//  Copyright © 2018年 陈樟权. All rights reserved.
//

#import "UIImageView+YBSWebCache.h"


#import "YBSPlayer.h"

#import <SDWebImage/UIButton+WebCache.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/SDWebImageDownloader.h>

@implementation UIImageView (YBSWebCache)

- (void)ybs_getImageFromeCacheWithImageUrlStr:(NSString *)imageUrl{
    
    if (imageUrl == nil || !imageUrl.length){
        
        self.image = YBSPlayerImage(@"YBSPlayer_loading_bgView"); // 默认站位图
        return;
    }
    
    
    UIImage *imageNone = [[SDImageCache sharedImageCache] imageFromMemoryCacheForKey:imageUrl];      // 内存
    if(!imageNone) imageNone = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:imageUrl];  // SD卡
    
    
    
    if (!imageNone) { // 如果 内存 和 SD卡 都没有 就去下载
        
        [self sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:YBSPlayerImage(@"YBSPlayer_loading_bgView")];
        
        [[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:imageUrl] options:SDWebImageProgressiveDownload | SDWebImageRetryFailed progress:^(NSInteger receivedSize, NSInteger expectedSize) {
//            WSDLog(@"正在下载--%d",receivedSize/expectedSize)
        } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
            
            if (!image || error){
                self.image = YBSPlayerImage(@"YBSPlayer_loading_bgView");
                return ;
            }
            self.image = image;
        }];
    }
    self.image = imageNone;
}

@end
