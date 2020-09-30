//
//  ViewController.m
//  SGAppKitExample
//
//  Created by kingsic on 2019/5/29.
//  Copyright © 2019年 kingsic. All rights reserved.
//

#import "ViewController.h"
#import "SGAppKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem SG_itemWithTarget:self action:@selector(leftBarButtonItem_action) title:@"item" titleColor:[UIColor redColor] titleFont:[UIFont boldSystemFontOfSize:17]];
    [self SG_setNavBarTitleColor:[UIColor brownColor] font:[UIFont boldSystemFontOfSize:22]];
    
    [self addSubViews];
}

- (void)addSubViews {
    CGFloat space = 20;
    CGFloat width = 0.5 * (self.view.frame.size.width - 3 * 20);
    UIButton *leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    leftBtn.frame = CGRectMake(space, 100, width, 50);
    [leftBtn SG_addCornerRadius:10 rectCorner:(UIRectCornerTopLeft | UIRectCornerBottomLeft)];
    [leftBtn SG_imageLocationStyle:(SGImageLocationStyleLeft) spacing:5 imageLocationBlock:^(UIButton * _Nonnull button) {
        [button setTitle:@"left Btn" forState:(UIControlStateNormal)];
        [button setImage:[UIImage imageNamed:@"test_img"] forState:(UIControlStateNormal)];
    }];
    leftBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:leftBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    rightBtn.frame = CGRectMake(CGRectGetMaxX(leftBtn.frame) + space, 100, width, 50);
    [rightBtn SG_addCornerRadius:10 rectCorner:(UIRectCornerTopRight | UIRectCornerBottomRight)];
    [rightBtn SG_imageLocationStyle:(SGImageLocationStyleRight) spacing:5 imageLocationBlock:^(UIButton * _Nonnull button) {
        [button setTitle:@"right Btn" forState:(UIControlStateNormal)];
        [button setImage:[UIImage imageNamed:@"test_img"] forState:(UIControlStateNormal)];
    }];    rightBtn.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rightBtn];
    
    UILabel *lab = [[UILabel alloc] init];
    lab.frame = CGRectMake(space, CGRectGetMaxY(leftBtn.frame) + space, self.view.frame.size.width - 2 * space, 60);
    lab.numberOfLines = 0;
    lab.textColor = [UIColor whiteColor];
    [lab SG_addCornerRadius:10];
    lab.attributedText = NSMutableAttributedString
    .SG_initWithString(@"曾经沧海难为水，除却巫山不是云\n取次花丛懒回顾，半缘修道半缘君")
    .SG_rangeColorFont(NSMakeRange(0, 2), [UIColor yellowColor], [UIFont boldSystemFontOfSize:20])
    .SG_rangeColor(NSMakeRange(12, 3), [UIColor yellowColor])
    .SG_lineSpacing(7);
    lab.textAlignment = NSTextAlignmentCenter;
    lab.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:lab];
    [lab SG_addTapActionWithBlock:^{
        NSLog(@"SG_addTapActionWithBlock");
    }];
}

#pragma mark - - action
- (void)leftBarButtonItem_action {
    NSLog(@"leftBarButtonItem_action");
}

@end
