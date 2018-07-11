//
//  YBSPlayerModel.m


#import "YBSPlayerModel.h"
#import "YBSPlayer.h"

@implementation YBSPlayerModel

- (UIImage *)placeholderImage {
    if (!_placeholderImage) {
        _placeholderImage = YBSPlayerImage(@"YBSPlayer_loading_bgView");
    }
    return _placeholderImage;
}
@end
