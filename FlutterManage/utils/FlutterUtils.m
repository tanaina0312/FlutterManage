//
//  FlutterUtils.m
//  FlutterManage
//
//  Created by bjhl on 2020/6/9.
//  Copyright © 2020 bjhl. All rights reserved.
//

#import "FlutterUtils.h"
#import <Flutter/Flutter.h>

@interface FlutterUtils ()<FlutterStreamHandler>{
    EventMethodChannelBlock _block;
}
@end

@implementation FlutterUtils

+ (instancetype)shareInstance; {
    static FlutterUtils *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[FlutterUtils alloc] init];
    });
    return _instance;
}

- (void)addEventMessageChannel:(NSString *)channelName flutterViewController:(FlutterViewController *)flutterViewController eventBlock:(nonnull EventMethodChannelBlock)block{
    FlutterEventChannel *event = [FlutterEventChannel eventChannelWithName:channelName binaryMessenger:flutterViewController.binaryMessenger];
    [event setStreamHandler:self];
    _block = block;
}

- (FlutterError* _Nullable)onListenWithArguments:(id _Nullable)arguments
                                       eventSink:(FlutterEventSink)events {
    if (_block) {
        _block(arguments, events);
    }
    return nil;
}

- (FlutterError* _Nullable)onCancelWithArguments:(id _Nullable)arguments{
    return nil;
}


- (void)addMethodChannel:(NSString *)channelName flutterViewController:(FlutterViewController *)flutterViewController methodBlock:(nonnull MethodChannelBlock)block{
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController.binaryMessenger];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if (block) {
            block(call, result);
        }
    }];
}
@end

