//
//  UIImageView+YBSWebCache.h
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/5/9.
//  Copyright © 2018年 严兵胜. All rights reserved.
//  从缓存中获取图片  缓存没有会直接下载

#import <UIKit/UIKit.h>

@interface UIImageView (YBSWebCache)

- (void)ybs_getImageFromeCacheWithImageUrlStr:(NSString *)imageUrl;

@end
