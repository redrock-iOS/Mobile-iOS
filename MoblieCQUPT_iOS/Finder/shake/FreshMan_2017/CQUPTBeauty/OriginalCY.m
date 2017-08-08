//
//  OriginalCY.m
//  SegmentView
//
//  Created by xiaogou134 on 2017/8/4.
//  Copyright © 2017年 xiaogou134. All rights reserved.
//

#import "OriginalCY.h"
#import "OriginalCYCell.h"
@interface OriginalCY ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)UITableView *tableView;

@property (nonatomic, copy)NSMutableArray *dataArray;
@property (nonatomic, copy)NSDictionary *dataDic;

@property (strong, nonatomic)NSArray *imageArray;
@property (strong, nonatomic)NSArray *nameArray;
@property (strong, nonatomic)NSString *timeArray;

@end

@implementation OriginalCY

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 120) style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _dataArray = [[NSMutableArray alloc] init];
    [self.view addSubview:_tableView];
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse = @"cell";
    OriginalCYCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[OriginalCYCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuse];
        
    }
    cell.textLabel.text = @"测试";
    cell.imageView.image = [UIImage imageNamed:@"军训特辑"];
    return cell;
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
    return 60;
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
