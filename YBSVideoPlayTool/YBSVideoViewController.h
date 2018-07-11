//
//  YBSVideoViewController.h
//  YBSVideoPlayTool
//
//  Created by 严兵胜 on 2018/7/5.
//  Copyright © 2018年 严兵胜. All rights reserved.
//

#import <UIKit/UIKit.h>


@class YBSPlayerModel;
@interface YBSVideoViewController : UIViewController


//@property (nonatomic, copy) playNextSetBlock playNextSetBlockItem;
@property (nonatomic ,strong) YBSPlayerModel *item;


@property (nonatomic, strong) NSString *courseIdStr; // 课程ID
@property (nonatomic, assign) NSInteger sectionNum; // 课程章节

@property (nonatomic, assign) NSInteger starPlaySecond; // 从第几秒开始播放

@end
