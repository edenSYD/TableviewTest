//
//  DeviceMacros.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#ifndef DeviceMacros_h
#define DeviceMacros_h

#define IOS11_OR_LATER_SPACE(par) \
({\
float space = 0.0;\
if (@available(iOS 11.0, *))\
space = par;\
(space);\
})
#define JF_KEY_WINDOW [UIApplication sharedApplication].keyWindow
#define JF_TOP_SPACE IOS11_OR_LATER_SPACE(JF_KEY_WINDOW.safeAreaInsets.top)
#define JF_TOP_ACTIVE_SPACE IOS11_OR_LATER_SPACE(MAX(0, JF_KEY_WINDOW.safeAreaInsets.top-20))
#define JF_BOTTOM_SPACE IOS11_OR_LATER_SPACE(JF_KEY_WINDOW.safeAreaInsets.bottom)


// iOS6时，导航VC中view的起始高度
#define YH_HEIGHT (iOS7_OR_LATER ? 64:0)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_4_OR_LESS       (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IOS11   @available(iOS 11.0, *)

#define  adjustsScrollViewInsets_NO(scrollView,vc)\
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
if ([UIScrollView instancesRespondToSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:")]) {\
[scrollView   performSelector:NSSelectorFromString(@"setContentInsetAdjustmentBehavior:") withObject:@(2)];\
} else {\
vc.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \
} while (0)
#endif /* DeviceMacros_h */
