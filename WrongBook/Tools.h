//
//  Tools.h
//  WrongBook
//
//  Created by apple on 2017/7/28.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tools : NSObject

+ (BOOL)checkPhone:(NSString *)phone;

+ (BOOL)checkPassword:(NSString *)password;

+ (BOOL)checkEmail:(NSString *)email;

+(BOOL)checkIdentityCardNo:(NSString*)cardNo;




@end
