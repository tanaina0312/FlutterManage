//
//  ViewController.m
//  FlutterManage
//
//  Created by bjhl on 2020/6/8.
//  Copyright © 2020 bjhl. All rights reserved.
//

#import "ViewController.h"
#import <Flutter/Flutter.h>
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) FlutterViewController *flutterViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(onBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)onBtn{
   AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    FlutterEngine *flutterEngine = delegate.flutterEngine;
    FlutterViewController *vc = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    [self presentViewController:vc animated:YES completion:nil];
    
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"flutter/test" binaryMessenger:vc.binaryMessenger];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"native/alert"]) {
            [self showAlert:vc];
        }
    }];
}

- (void)showAlert:(UIViewController *)viewController{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提升" message:@"flutter传递过来的消息" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertView addAction:action];
    [viewController presentViewController:alertView animated:YES completion:nil];
}

@end
