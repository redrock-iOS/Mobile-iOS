//
//  TimeChooseViewController.m
//  Demo
//
//  Created by 李展 on 2016/11/26.
//  Copyright © 2016年 zhanlee. All rights reserved.
//

#import "TimeChooseViewController.h"
#import "MainView.h"
#import "PrefixHeader.pch"
#import "ChooseButton.h"


@interface TimeChooseViewController ()
@property NSMutableArray *dataArray;
@property MainView *mainView;
@property NSMutableArray *buttonArray;
@end

@implementation TimeChooseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"时间编辑";
    self.view.backgroundColor = [UIColor whiteColor];
    self.buttonArray = [NSMutableArray array];
    self.mainView = [[MainView alloc]initWithFrame:CGRectMake(0, STATUSBARHEIGHT+NVGBARHEIGHT, SCREENWIDTH, SCREENHEIGHT-STATUSBARHEIGHT-NVGBARHEIGHT)];
    [self.view addSubview:self.mainView];
    self.mainView.backgroundColor = [UIColor colorWithRed:246/255.f green:246/255.f blue:246/255.f alpha:1];
    for (int i = 0; i<DAY; i++) {
        for (int j = 0; j<LONGLESSON; j++) {
            ChooseButton *btn = [[ChooseButton alloc]initWithFrame:CGRectMake(MWIDTH+i*LESSONBTNSIDE+SEGMENT/2, j*LESSONBTNSIDE*2+SEGMENT/2, LESSONBTNSIDE-SEGMENT, LESSONBTNSIDE*2-SEGMENT)];
            btn.tag = i*LONGLESSON+j;
            if ([self.dataArray containsObject:@(btn.tag)]) {
                btn.selected = YES;
            }
            [self.buttonArray addObject:btn];
            [self.mainView.scrollView addSubview:btn];
        }
    }
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"完成"] style:UIBarButtonItemStyleDone target:self action:@selector(save)];
    saveItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = saveItem;
    // Do any additional setup after loading the view.
}

- (instancetype)initWithTimeArray:(NSArray *)timeArray{
    self = [self init];
    if (self) {
        self.dataArray = [timeArray mutableCopy];
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save{
    self.dataArray = [NSMutableArray array];
    for (ChooseButton *btn in self.buttonArray) {
        if (btn.selected == YES) {
            [self.dataArray addObject:@(btn.tag)];
        }
    }
    if ([self.delegate respondsToSelector:@selector(saveTimes:)]) {
        [self.delegate saveTimes:self.dataArray];
    }
    [self.navigationController popViewControllerAnimated:YES];
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
