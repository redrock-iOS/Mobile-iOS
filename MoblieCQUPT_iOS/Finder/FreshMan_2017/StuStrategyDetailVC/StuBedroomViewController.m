//
//  StuBedroomViewController.m
//  TestLayoutButton
//
//  Created by helloworld on 2017/8/4.
//  Copyright © 2017年 topkid. All rights reserved.
//

#import "StuBedroomViewController.h"
#import "StuBedroomCellTableViewCell.h"

@interface StuBedroomViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableDictionary *height;
@end

@implementation StuBedroomViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 47 - 64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.bounces = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        //        _tableView.allowsSelection = NO;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return _tableView;
    }
    return _tableView;
}

- (NSMutableDictionary *)height {
    if (! _height) {
        _height = [NSMutableDictionary dictionary];
    }
    
    return _height;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    StuBedroomCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StuBedroomCellTableViewCell" owner:nil options:nil] lastObject];;
    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.nameLabel.text = @"233";
//    cell.numberLabel.text = @"asfsfasd";
//    if (indexPath.row == 1) {
//    cell.descriptionLabel.text = @"sdjagfvsdkvafjvsjfvskjdavfbdjkvfbdjzkfbauvfsjvfuaBKufgvbuzsjbkfjhsdkzgbuzdsgsdthrdtgdrfgdjhgkbdsjkgbjzsgbfdskbgiudxgbudsbgudkbrgkdxubguftgbdxjkbgjdxkbgurkbgdjzbfgseibgdizlbgiseurgbdjkbgjdxbgjksbzdjfgkbsgesdubrfgkdzrgiuerlsnkxjfbgvnirlbgnzdjklbngfiseulbgkjdlnfgiueslgndzfilbgn";
//    }
//    else {
//        cell.descriptionLabel.text = @"哈哈";
//    }
    cell = [cell cell:cell IndexPath:indexPath];
    
    [cell layoutIfNeeded];
    NSLog(@"cell.height----->%lf", cell.height);
    self.height[@(indexPath.row)] = @(cell.height);
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.height[@(indexPath.row)] doubleValue];
}

//返回估计高度。先执行创建cell在执行cell高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
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
