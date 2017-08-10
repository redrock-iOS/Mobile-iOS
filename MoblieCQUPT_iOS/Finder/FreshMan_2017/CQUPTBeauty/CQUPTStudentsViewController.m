//
//  CQUPTStudentsViewController.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/7.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "CQUPTStudentsViewController.h"
#import "CQUPTStudentsCell.h"
#import "UIImage+Circle.h"
#import "AppearView.h"


@interface CQUPTStudentsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic)UITableView *tableView;

@property (nonatomic, copy)NSMutableArray *dataArray;

@property (strong, nonatomic)NSArray *nameArray;

@property (strong, nonatomic)AppearView *viewS;
@end

@implementation CQUPTStudentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 120) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _dataArray = [[NSMutableArray alloc] init];
    self.tableView.backgroundColor = [UIColor colorWithRed:235/255.0 green:240/255.0 blue:242/255.0 alpha:1];
    [self.view addSubview:_tableView];
    
}
- (void)getTheStudentsName:(NSArray *)name AndContext:(NSArray *) context{
    _nameArray = name;
    _contextArray = context;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse = @"cell";
    CQUPTStudentsCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[CQUPTStudentsCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:reuse];
        
    }
    
    cell.idLabel.text = _nameArray[indexPath.row];
    cell.imagesView.image = [UIImage cutCircleImage:_nameArray[indexPath.row]];
    cell.contextLabel.text = _contextArray[indexPath.row];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _nameArray.count;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _viewS = [[AppearView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)WithString:_nameArray[indexPath.row] AndContext:_contextArray[indexPath.row]];
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    _viewS.closeImage.userInteractionEnabled = YES;
    [_viewS.closeImage addGestureRecognizer:tapRecognizer];
    [self.view.window addSubview:_viewS];
}
- (void)tap{
    [_viewS removeFromSuperview];
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
