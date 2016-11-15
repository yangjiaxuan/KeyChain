//
//  ViewController.m
//  KeyChain
//
//  Created by yangsen on 16/11/15.
//  Copyright © 2016年 sitemap. All rights reserved.
//

#import "ViewController.h"
#import "PasswordCatchTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UserPasswordModel *userPM = [UserPasswordModel userPasswordModelWithUserName:@"a" password:@"aa"];
    
    [PasswordCatchTool saveUserPassword:userPM];
    
    NSDictionary *pass = [PasswordCatchTool getPasswordForUser:@"a"];
    
    userPM = [UserPasswordModel userPasswordModelWithUserName:@"b" password:@"bb"];
    
    [PasswordCatchTool saveUserPassword:userPM];
    
     NSDictionary *allPass = [PasswordCatchTool getAllPasswords];
    
    userPM = [UserPasswordModel userPasswordModelWithUserName:@"c" password:@"cc"];
    
    [PasswordCatchTool saveUserPassword:userPM];
    
     allPass = [PasswordCatchTool getAllPasswords];
    
    [PasswordCatchTool deletePasswordForUser:@"a"];
    
    allPass = [PasswordCatchTool getAllPasswords];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
