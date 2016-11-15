//
//  PasswordCatchTool.h
//  BeiJingTrain
//
//  Created by yangsen on 16/11/15.
//  Copyright © 2016年 徐汇区 上海市. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KEY_USERNAME_PASSWORD_SEVER   @"KEY_USERNAME_PASSWORD_SEVER"

@interface UserPasswordModel : NSObject

@property (copy, nonatomic) NSString *userName;
@property (copy, nonatomic) NSString *password;

+ (id)userPasswordModelWithUserName:(NSString *)userName password:(NSString *)password;

@end

@interface PasswordCatchTool : NSObject

+ (void)saveUserPassword:(UserPasswordModel *)userPasswordModel;

+ (void)deletePasswordForUser:(NSString *)userName;

+ (UserPasswordModel *)getPasswordForUser:(NSString *)userName;

+ (NSDictionary *)getAllPasswords;

@end
