//
//  UtilsMacros.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#ifndef UtilsMacros_h
#define UtilsMacros_h

//获取系统对象
#define kApplication        [UIApplication sharedApplication]
#define kAppWindow          [UIApplication sharedApplication].delegate.window
#define kAppDelegate        [AppDelegate shareAppDelegate]
#define kRootViewController [UIApplication sharedApplication].delegate.window.rootViewController
#define kUserDefaults       [NSUserDefaults standardUserDefaults]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

//判断是不是IPhoneX
#define YYIS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define YYISiPhoneX [[UIScreen mainScreen] bounds].size.width >=375.0f && [[UIScreen mainScreen] bounds].size.height >=812.0f&& YYIS_IPHONE
// 状态栏高度
#define STATUS_BAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height
#define kStatusBarHeight (CGFloat)(YYISiPhoneX?(44):(20))
// NavBar高度
#define NAVIGATION_BAR_HEIGHT 44.0
#define kNavBarHBelow7 (44)
// TabBar高度
#define kTabBarHeight   (CGFloat)(YYISiPhoneX?(49+34):(49))
#define SYDTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
// 状态栏 ＋ 导航栏 高度
#define SYDTopHeight ((STATUS_BAR_HEIGHT + NAVIGATION_BAR_HEIGHT))
#define kNavBarHAbove7  (CGFloat)(YYISiPhoneX?(88):(64))

// iPhoneX的状态栏高度差值
#define kTopBarDifHeight  (CGFloat)(YYISiPhoneX?(24):(0))

//从navigationbar以下布局可以使用以下代码设置控件的Top
#define PCBStatusBar_Height      [[UIApplication sharedApplication] statusBarFrame].size.height
#define PCBNavigationBar_Height  self.navigationController.navigationBar.frame.size.height
#define PCBHeight_64             (PCBStatusBar_Height + PCBNavigationBar_Height)

// 顶部安全区域远离高度
#define kTopBarSafeHeight (CGFloat)(YYISiPhoneX?(44):(0))
// 底部安全区域远离高度
#define kBottomSafeHeight (CGFloat)(YYISiPhoneX?(34):(0))

// 屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)
// 屏幕宽度
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
// 屏幕高度
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

//3.根据屏幕宽度比、适配不同机型/---根据ip6的屏幕来拉伸
#define PCBScreenWidthRatio      (SCREEN_WIDTH / 375.0)
#define PCBAdapted_Width(x)      (ceilf((x) * PCBScreenWidthRatio))
#define Iphone6ScaleWidth SCREEN_WIDTH/375.0
#define Iphone6ScaleHeight SCREEN_HEIGHT/667.0
//根据ip6的屏幕来拉伸
#define kRealValue(with) ((with)*(SCREEN_WIDTH/375.0f))
// 除状态栏、导航栏后的高度
#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

// 除状态栏、导航栏后Frame
#define CONTENT_RECT CGRectMake(0, SYDTopHeight, SCREEN_WIDTH, CONTENT_HEIGHT)

// 屏幕分辨率
#define SCREEN_RESOLUTION (SCREEN_WIDTH * SCREEN_HEIGHT * ([UIScreen mainScreen].scale))

// 分隔线高度
#define SEPARATOR_HEIGHT 0.6

// 强弱引用
#define WEAKSELF __weak typeof(self) weakSelf = self;
#define STRONGSELF(type) __strong typeof(type) type = weak##type;

//View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

//property 属性快速声明 别用宏定义了，使用代码块+快捷键实现吧

///IOS 版本判断
#define IOSAVAILABLEVERSION(version) ([[UIDevice currentDevice] availableVersion:version] < 0)
// 当前系统版本
#define CurrentSystemVersion [[UIDevice currentDevice].systemVersion doubleValue]
//当前语言
#define CurrentLanguage (［NSLocale preferredLanguages] objectAtIndex:0])

//-------------------打印日志-------------------------
//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

//字体
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//定义UIImage对象
#define ImageWithFile(_pointer) [UIImage imageWithContentsOfFile:([[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@%dx", _pointer, (int)[UIScreen mainScreen].nativeScale] ofType:@"png"])]
#define IMAGE_NAMED(name) [UIImage imageNamed:name]

//数据验证
#define StrValid(f) (f!=nil && [f isKindOfClass:[NSString class]] && ![f isEqualToString:@""])
#define SafeStr(f) (StrValid(f) ? f:@"")
#define HasString(str,key) ([str rangeOfString:key].location!=NSNotFound)

#define ValidStr(f) StrValid(f)
#define ValidDict(f) (f!=nil && [f isKindOfClass:[NSDictionary class]])
#define ValidArray(f) (f!=nil && [f isKindOfClass:[NSArray class]] && [f count]>0)
#define ValidNum(f) (f!=nil && [f isKindOfClass:[NSNumber class]])
#define ValidClass(f,cls) (f!=nil && [f isKindOfClass:[cls class]])
#define ValidData(f) (f!=nil && [f isKindOfClass:[NSData class]])

//获取一段时间间隔
#define kStartTime CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();
#define kEndTime  NSLog(@"Time: %f", CFAbsoluteTimeGetCurrent() - start)
//打印当前方法名
#define ITTDPRINTMETHODNAME() ITTDPRINT(@"%s", __PRETTY_FUNCTION__)

//发送通知
#define KPostNotification(name,obj) [[NSNotificationCenter defaultCenter] postNotificationName:name object:obj];
// 关闭键盘
#define HIDE_KEYBOARD [[UIApplication sharedApplication].keyWindow endEditing:YES];


//单例化一个类
#define SINGLETON_FOR_HEADER(className) \
\
+ (className *)shared##className;

#define SINGLETON_FOR_CLASS(className) \
\
+ (className *)shared##className { \
static className *shared##className = nil; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared##className = [[self alloc] init]; \
}); \
return shared##className; \
}
#endif /* UtilsMacros_h */
