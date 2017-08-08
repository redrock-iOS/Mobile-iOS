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
@interface StuRootViewController ()

@end

@implementation StuRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    OriginalCY * vc1 = [[OriginalCY alloc]init];
    vc1.title = @"原创重邮";
    NSArray *vcArray = @[vc1];
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.bounds.size.height - 20) andControllers:vcArray];
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
