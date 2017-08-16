//
//  DailyLifeViewController.m
//  TestLayoutButton
//
//  Created by helloworld on 2017/8/4.
//  Copyright © 2017年 topkid. All rights reserved.
//

#import "BeautyTableViewCell.h"
#import "DailyLifeViewController.h"

@interface DailyLifeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *urlStrArray;
@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) NSMutableArray *positionArray;
@property (strong, nonatomic) NSMutableArray *commentArray;
@end

@implementation DailyLifeViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - (SCREENHEIGHT-64)*50/667 - 64) style:UITableViewStylePlain];
        UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 6)];
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
    
    self.nameArray = [[NSMutableArray alloc] init];
    self.urlStrArray = [[NSMutableArray alloc] init];
    self.positionArray = [[NSMutableArray alloc] init];
    self.commentArray = [[NSMutableArray alloc] init];
    
    [self getData];
    [self.view addSubview:self.tableView];
}

- (void)getData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    [manager GET:@"http://hongyan.cqupt.edu.cn/welcome/2017/api/apiForGuide.php?RequestType=LifeInNear" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseobject) {
        NSDictionary *dic = responseobject;
        for (int i = 0; i < [dic[@"Data"] count]; i++) {
            self.nameArray[i] = dic[@"Data"][i][@"name"];
            self.positionArray[i] = dic[@"Data"][i][@"location"];
            self.urlStrArray[i] = dic[@"Data"][i][@"url"][0];
            self.commentArray[i] = dic[@"Data"][i][@"resume"];
        }
        [self.tableView reloadData];
        
    }failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"请求失败,error:%@", error);
    }];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"BeautyTableViewCell";
    BeautyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"BeautyTableViewCell" owner:nil options:nil] lastObject];;
    }
    
    NSString* encodedString = @"";
    if (self.urlStrArray) {
        cell.nameLabel.text = self.nameArray[indexPath.row];
        cell.positionLabel.text = self.positionArray[indexPath.row];
        cell.viewLabel.text = self.commentArray[indexPath.row];
        encodedString = [self.urlStrArray[indexPath.row] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
    }
    cell.bottomGrayView.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.nameLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    cell.viewLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    cell.positionLabel.textColor = [UIColor colorWithRed:101/255.0 green:178/255.0 blue:255/255.0 alpha:0.6];
    cell.nameImageView.contentMode = UIViewContentModeScaleToFill;
    cell.nameImageView.image = [UIImage imageNamed:@"freshman_image_comment"];
    
    cell.positionImageView.contentMode = UIViewContentModeScaleToFill;
    cell.positionImageView.image = [UIImage imageNamed:@"定位"];
    cell.positionImageView.alpha = 0.2;
    
    cell.myImageView.contentMode = UIViewContentModeScaleToFill;
    cell.myImageView.layer.cornerRadius = 2;
    cell.myImageView.layer.masksToBounds = YES;
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:encodedString] placeholderImage:[UIImage imageNamed:@"占位图"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 114;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.nameArray) {
        return self.nameArray.count;
    }
    else {
        return 55;
    }
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
