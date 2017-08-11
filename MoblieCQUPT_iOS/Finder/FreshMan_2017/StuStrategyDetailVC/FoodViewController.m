//
//  FoodViewController.m
//  TestLayoutButton
//
//  Created by helloworld on 2017/8/4.
//  Copyright © 2017年 topkid. All rights reserved.
//

#import "BeautyTableViewCell.h"
#import "FoodViewController.h"

@interface FoodViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation FoodViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 47 - 64) style:UITableViewStylePlain];
        UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 8)];
        grayView.backgroundColor = [UIColor colorWithRed:235/255.0 green:240/255.0 blue:242/255.0 alpha:1];
        [_tableView addSubview:grayView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return _tableView;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"BeautyTableViewCell";
    BeautyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BeautyTableViewCell" owner:nil options:nil] lastObject];;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.nameLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    cell.viewLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    cell.positionLabel.textColor = [UIColor colorWithRed:101/255.0 green:178/255.0 blue:255/255.0 alpha:0.6];
    cell.nameLabel.text = @"老君洞";
    cell.positionLabel.text = @"邮电大学新校门老校门北校门西校门东校门emmmmmm";
    cell.nameImageView.contentMode = UIViewContentModeScaleToFill;
    cell.nameImageView.image = [UIImage imageNamed:@"1"];
    
    cell.positionImageView.contentMode = UIViewContentModeScaleToFill;
    cell.positionImageView.image = [UIImage imageNamed:@"1"];
    
    cell.myImageView.contentMode = UIViewContentModeScaleToFill;
    cell.myImageView.image = [UIImage imageNamed:@"1"];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 114;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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
