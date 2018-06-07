//
//  NotificationMacros.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#ifndef NotificationMacros_h
#define NotificationMacros_h

#pragma mark - ——————— 用户相关 ————————
//登录状态改变通知
#define KNotificationLoginStateChange @"loginStateChange"
#define LoginSuccess @"loginsuccess"
//自动登录成功
#define KNotificationAutoLoginSuccess @"KNotificationAutoLoginSuccess"

//被踢下线
#define KNotificationOnKick @"KNotificationOnKick"

//用户信息缓存 名称
#define KUserCacheName @"KUserCacheName"
//  用户ID
#define USER_ID @"user_id"
// 用户名字
#define USER_NAME @"user_name"
//用户密码
#define USER_PASSWORD @"passWord"
// token
#define TOKEN_KEY  @"token"
// 存储时间
#define Invaild_KEY @"invaildDate"
//用户model缓存
#define KUserModelCache @"KUserModelCache"

#pragma mark - ——————— 网络状态相关 ————————
//网络状态变化
#define KNotificationNetWorkStateChange @"KNotificationNetWorkStateChange"

#pragma mark - ——————— 接口相关 ————————
//内部版本号 每次发版递增
#define KVersionCode 1
/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever    0
#define TestSever       1
#define ProductSever    0

#if DevelopSever
/**开发服务器*/
#define URL_main @"https://192.168.10.138:2061"
#define URL_CDN @"http://mujin"
#elif TestSever
/**测试服务器*/
#define URL_main @"https://192.168.10.5:2061"
#define URL_CDN @"http://mujin"
#elif ProductSever
/**生产服务器*/
#define URL_main @"https://192.168.10.138:2061"
#define URL_CDN @"http://mujin"
#endif

//登录
#define URL_user_login @"/mobile/login"
//登出
#define URL_user_loginout @"/mobile/logout"
//检查登录密码
#define URL_checkUserPassword @"/mobile/currentUser/checkUserPassword"
//修改用户信息
#define URL_user_update @"/mobile/currentUser/update"
//修改密码
#define URL_changeUserPassword @"/mobile/currentUser/changeUserPassword"

//通知列表
#define URL_message @"/mobile/message/query"

//签到
#define URL_SIGN @"/mobile/sign"
//签到详情
#define URL_SIGN_Date @"/mobile/sign/getDate"

//一键上传
#define URL_UPLOAD @"/mobile/data/upload"
//外访列表
#define URL_ApplyCase @"/mobile/case/queryApplyCase"
//外访任务统计
#define URL_CASE @"/mobile/case/count"
//保存外访信息
#define URL_saveVisitRecord @"/mobile/case/saveVisitRecord"
//催收记录
#define URL_queryMark @"/mobile/case/queryMark"
//案件信息
#define URL_CaseInfo @"/mobile/case/queryCaseInfo"


//重新规划
#define URL_PathPlan @"/mobile/plan/pathPlan"
//行程规划
#define URL_Plan @"/mobile/plan/queryPlan"
//状态需改
#define URL_Plan_Update @"/mobile/plan/update"
//状态需改
#define URL_Plan_Detail @"/mobile/plan/queryDetail"

#endif /* NotificationMacros_h */

/**
 ERROR_01(-1, "系统异常，请联系管理员"),
 SUCCESS(0, "操作成功"),
 UN_SUCCESS(1, "操作失败"),
 ERROR_101(101, "认证失败"),
 ERROR_102(102, "缺少参数或参数不正确"),
 ERROR_103(103, "正在处理中"),
 ERROR_104(104, "请勿重复操作"),
 ERROR_105(105, "JSON格式错误"),
 ERROR_106(106, "时间日期格式不正确"),
 ERROR_107(107, "数据库操作失败"),
 ERROR_108(108, "文件格式不支持"),
 ERROR_109(109, "处理数据条数不能超过1000条"),
 ERROR_110(110, "操作失败"),
 ERROR_111(111, "操作类型不存在或未开通"),
 ERROR_113(113, "数据已存在"),
 ERROR_114(114, "数据不存在"),
 ERROR_115(115, "当前设备时间未校准，校准后才可正常使用"),
 ERROR_116(116, "请选择正确的上级机构"),
 ERROR_117(117, "参数格式错误"),
 ERROR_118(118, "存在不合规数据"),
 ERROR_119(119, "上传文件过大"),
 ERROR_120(120, "上传文件时发生异常"),
 ERROR_121(121, "参数格式不正确"),
 ERROR_122(122, "参数类型未对应"),
 ERROR_123(123, "excel文件校验异常"),
 ERROR_124(124, "用户未绑定分机号"),
 ERROR_125(125, "手机号加密失败"),
 ERROR_126(126, "存在重复绑定的分机号"),
 ERROR_127(127, "保存模板文件失败"),
 ERROR_500(500, "系统繁忙，请稍后再试"),
 ERROR_1111(1111, "未查到对应的短信模板"),
 ERROR_2111(2111, "上传的不是excl文件"),
 ERROR_2112(2112, "上传的excl文件为空"),
 ERROR_2113(2113, "上传还款记录未找到对应的 "),
 ERROR_2114(2114, "上传还款记录对应的案件已撤案"),
 ERROR_125(125, "手机号加密失败"),
 ERROR_126(126, "存在重复绑定的分机号"),
 ERROR_127(127, "保存模板文件失败"),
 ERROR_500(500, "系统繁忙，请稍后再试"),
 ERROR_1111(1111, "未查到对应的短信模板"),
 ERROR_2111(2111, "上传的不是excl文件"),
 ERROR_2112(2112, "上传的excl文件为空"),
 ERROR_2113(2113, "上传还款记录未找到对应的 "),
 ERROR_2114(2114, "上传还款记录对应的案件已撤案"),
 ERROR_2115(2115, "上传还款记录字段出现错误"),
 ERROR_61005(61005, "获取验证码类型不存在"),
 ERROR_61006(61006, "获取验证码频率太快"),
 ERROR_61007(61007, "验证码发送失败"),
 ERROR_61008(61008, "验证码不正确"),
 ERROR_61009(61009, "请输入验证码"),
 ERROR_61010(61010, "验证码不正确或已过期"),
 ERROR_61011(61011, "用户类型不存在"),
 ERROR_61012(61012, "用户权限不足"),
 ERROR_61013(61013, "用户不存在"),
 ERROR_61014(61014, "用户已存在"),
 ERROR_61015(61015, "密码格式不正确"),
 ERROR_61016(61016, "账号或密码不正确"),
 ERROR_61019(61019, "会话已过期，请重新登录"),
 ERROR_61021(61021, "用户状态异常，请联系客服"),
 ERROR_61025(61025, "原密码不正确"),
 ERROR_61028(61028, "密码不能为空"),
 ERROR_61029(61029, "登录名不能为空"),
 ERROR_61031(61031, "用户未登录"),
 ERROR_61032(61032, "邮箱格式不正确"),
 ERROR_61033(61033, "手机号码格式不正确"),
 ERROR_61034(61034, "部门删除失败，该部门仍有人员"),
 ERROR_61035(61035, "职位删除失败，该职位仍有人员"),
 ERROR_61036(61036, "网络异常"),
 ERROR_61037(61037, "该请求方式未提供"),
 ERROR_6
 **/
