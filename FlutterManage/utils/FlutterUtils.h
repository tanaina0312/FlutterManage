//
//  FlutterUtils.h
//  FlutterManage
//
//  Created by bjhl on 2020/6/9.
//  Copyright © 2020 bjhl. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Flutter;

NS_ASSUME_NONNULL_BEGIN

typedef void(^EventMethodChannelBlock)(id _Nullable arguments, FlutterEventSink sink);

typedef void(^MethodChannelBlock)(FlutterMethodCall *call, FlutterResult result);

@interface FlutterUtils : NSObject

+ (instancetype)shareInstance;

- (void)addEventMessageChannel:(NSString *)channelName flutterViewController:(FlutterViewController *)flutterViewController eventBlock:(EventMethodChannelBlock)block;

- (void)addMethodChannel:(NSString *)channelName flutterViewController:(FlutterViewController *)flutterViewController methodBlock:(MethodChannelBlock)block;

@end

NS_ASSUME_NONNULL_END
