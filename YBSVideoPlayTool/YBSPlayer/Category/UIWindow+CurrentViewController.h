//
//  UIWindow+CurrentViewController.h

#import <UIKit/UIKit.h>

@interface UIWindow (CurrentViewController)

/*!
 @method currentViewController
 
 @return Returns the topViewController in stack of topMostController.
 */
- (UIViewController*)ybs_currentViewController;
@end
