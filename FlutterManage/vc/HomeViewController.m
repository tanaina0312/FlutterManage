//
//  HomeViewController.m
//  FlutterManage
//
//  Created by bjhl on 2020/6/9.
//  Copyright © 2020 bjhl. All rights reserved.
//

#import "HomeViewController.h"
#import <Masonry/Masonry.h>
#import <Flutter/Flutter.h>
#import "AppDelegate.h"
#import "FlutterUtils.h"

@interface HomeViewController (){
    UIButton *_btn;
    FlutterViewController *_flutterVC;
    FlutterEventSink _sink;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"HomePage";
    self.view.backgroundColor = [UIColor whiteColor];
    
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    FlutterEngine *flutterEngine = delegate.flutterEngine;
    _flutterVC = [[FlutterViewController alloc] initWithEngine:flutterEngine nibName:nil bundle:nil];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.backgroundColor = [UIColor systemBlueColor];
    [_btn setTitle:@"跳转FlutterVC" forState:UIControlStateNormal];
    [self.view addSubview:_btn];
    
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.center.equalTo(self.view);
         make.size.mas_equalTo(CGSizeMake(120, 40));
    }];
    
    [_btn addTarget:self action:@selector(onBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [self initFlutter];
    
}

- (void)initFlutter {
   [[FlutterUtils shareInstance] addEventMessageChannel:@"native/event" flutterViewController:_flutterVC eventBlock:^(id  _Nullable arguments, FlutterEventSink  _Nonnull sink) {
        self->_sink = sink;
    }];
    
    [[FlutterUtils shareInstance] addMethodChannel:@"native/method" flutterViewController:_flutterVC methodBlock:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if([call.method isEqualToString:@"back"]){
            [self.navigationController popViewControllerAnimated:YES];
        }
    }];
}

- (void)onBtn:(UIButton *)btn {
    [self.navigationController pushViewController:_flutterVC animated:YES];
    self.navigationController.navigationBar.hidden = YES;
//    _sink(@{@"title" : @"HomeViewController"});
}

@end

