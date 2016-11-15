//
//  KeyChainManager.h
//  BeiJingTrain
//
//  Created by yangsen on 16/11/15.
//  Copyright © 2016年 徐汇区 上海市. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainManager : NSObject

+ (void)saveService:(NSString *)service data:(id)data;

+ (id)loadService:(NSString *)service;

+ (void)deleteService:(NSString *)service;

@end
