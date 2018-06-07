//
//  EnumMacros.h
//  MuJinForeignVisit
//
//  Created by 孙元东 on 2018/2/7.
//  Copyright © 2018年 MuJin. All rights reserved.
//

#ifndef EnumMacros_h
#define EnumMacros_h

#define JKSafeArray(array)   [JKDataHelper safeArray:array]
#define JKSafeMutableArray(mutableArray)   [JKDataHelper safeMutableArray:mutableArray]
#define JKSafeDic(dict)   [JKDataHelper safeDictionary:dict]
#define JKSafeMutableDic(mutableDict)   [JKDataHelper safeMutableDictionary:mutableDict]
#define JKSafeStr(str)   [JKDataHelper safeStr:str]
#define JKSafeStr1(str, defaultStr)   [JKDataHelper safeStr:str defaultStr:defaultStr]
#define JKSafeObj(obj)   [JKDataHelper safeObj:obj]

#endif /* EnumMacros_h */
