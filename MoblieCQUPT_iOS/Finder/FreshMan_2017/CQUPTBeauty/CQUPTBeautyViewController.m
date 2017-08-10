//
//  CQUPTBeautyViewController.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/8.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "CQUPTBeautyViewController.h"
#import "CQUPTBeautyCell.h"

@interface CQUPTBeautyViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) CQUPTBeautyCell *cell;
@end

@implementation CQUPTBeautyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 120) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    
    // Do any additional setup after loading the view.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse = @"cell";
    _cell = [[CQUPTBeautyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    if (!_cell) {
        _cell = [[CQUPTBeautyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuse];
    }
    _cell.imagesView.image = [UIImage imageNamed:@"春日落樱"];
    [_cell setContextLabelText:@"樱花烂漫红陌上，花开花落皆是景\n春风暖，吹绿了重邮，朵朵樱花饱吮着雨露的滋润，与绿叶相衬，在春风的轻抚中缓缓舒展。让我们一起漫步在三月的重邮，去欣赏那些美丽的存在。"];
    return _cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;

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
