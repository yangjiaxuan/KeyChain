//
//  PasswordCatchTool.m
//  BeiJingTrain
//
//  Created by yangsen on 16/11/15.
//  Copyright © 2016年 yangsen. All rights reserved.
//

#import "PasswordCatchTool.h"
#import "KeyChainManager.h"

@interface UserPasswordModel()<NSCoding>

@end
@implementation UserPasswordModel

+ (id)userPasswordModelWithUserName:(NSString *)userName password:(NSString *)password{
    UserPasswordModel *userPModel = [[UserPasswordModel alloc]init];
    userPModel.userName = userName;
    userPModel.password = password;
    return userPModel;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init]) {
        self.userName = [aDecoder decodeObjectForKey:@"userName"];
        self.password = [aDecoder decodeObjectForKey:@"password"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{

    [aCoder encodeObject:self.userName forKey:@"userName"];
    [aCoder encodeObject:self.password forKey:@"password"];
}
@end


@implementation PasswordCatchTool

+ (void)saveUserPassword:(UserPasswordModel *)userPasswordModel{

    NSMutableDictionary *passWords = [NSMutableDictionary dictionaryWithDictionary:[KeyChainManager loadService:KEY_USERNAME_PASSWORD_SEVER]];
    if (!passWords) {
        passWords = [NSMutableDictionary dictionary];
    }
    
    [passWords setObject:userPasswordModel forKey:userPasswordModel.userName];
    [KeyChainManager saveService:KEY_USERNAME_PASSWORD_SEVER data:passWords];
}

+ (void)deletePasswordForUser:(NSString *)userName{
    NSMutableDictionary *passWords = [KeyChainManager loadService:KEY_USERNAME_PASSWORD_SEVER];
    [passWords removeObjectForKey:KEY_USERNAME_PASSWORD_SEVER];
    [KeyChainManager saveService:KEY_USERNAME_PASSWORD_SEVER data:[passWords copy]];
}

+ (UserPasswordModel *)getPasswordForUser:(NSString *)userName{
    NSMutableDictionary *passWords = [KeyChainManager loadService:KEY_USERNAME_PASSWORD_SEVER];
    return (UserPasswordModel *)[passWords objectForKey:userName];
}

+ (NSDictionary *)getAllPasswords{
    return [KeyChainManager loadService:KEY_USERNAME_PASSWORD_SEVER];
}

@end
