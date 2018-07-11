//
//  YBSVideoViewController.m
//  YBSVideoPlayTool
//
//  Created by 严兵胜 on 2018/7/5.
//  Copyright © 2018年 严兵胜. All rights reserved.
//

#import "YBSVideoViewController.h"


#import "YBSPlayerModel.h"

@interface YBSVideoViewController ()

@end

@implementation YBSVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)starPlay{
    
    self.item.title = @"视屏内容请展示"; // self.courseDetailsItem.course_name;
    self.item.videoURL = [NSURL URLWithString:@"http://static.smartisanos.cn/common/video/proud-farmer.mp4"]; // [NSURL URLWithString:self.courseDetailsItem.theUrl];
    self.item.placeholderImageURLString = @"";
    // 从xx秒开始播放视频
    self.item.seekTime =  0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
