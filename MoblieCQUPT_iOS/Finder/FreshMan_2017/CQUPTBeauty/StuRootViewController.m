//
//  StuRootViewController.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/7.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "StuRootViewController.h"
#import "OriginalCY.h"
#import "SegmentView.h"
#include "CQUPTStudentsViewController.h"
@interface StuRootViewController ()

@end

@implementation StuRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    OriginalCY * vc1 = [[OriginalCY alloc]init];
    vc1.title = @"原创重邮";
    CQUPTStudentsViewController *vc2 = [[CQUPTStudentsViewController alloc] init];
    vc2.title = @"优秀学生";
    NSArray *vcArray = @[vc1,vc2];
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.bounds.size.height - 20) andControllers:vcArray];
    NSArray *name = @[@"丛广林",@"刘志宗",@"冯益青", @"刘慧鹏", @"郭鑫", @"马晨歌", @"田彬人", @"20-810宿舍", @"04991401班", @"热则耶·吐尔洪", @"姜玉琦", @"谭威", @"王金鸡", @"刘国栋", @"刘锐",@"王秋毅", @"刘志凡", @"王婷", @"041201班"];
    [vc2 getTheStudentsName:name];
    [self.view addSubview:segmentView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
