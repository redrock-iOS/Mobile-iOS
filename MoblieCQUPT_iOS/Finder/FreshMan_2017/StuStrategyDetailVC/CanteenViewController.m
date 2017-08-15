//
//  CanteenViewController.m
//  TestLayoutButton
//
//  Created by helloworld on 2017/8/4.
//  Copyright © 2017年 topkid. All rights reserved.
//

#import "MyTableViewCell.h"
#import "CanteenViewController.h"

@interface CanteenViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *urlStrArray;
@property (strong, nonatomic) NSMutableArray *nameArray;
@property (strong, nonatomic) NSMutableArray *descriptionArray;

@end

@implementation CanteenViewController


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.view.superview.height*50/667 - 64) style:UITableViewStylePlain];
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
    self.descriptionArray = [[NSMutableArray alloc] init];
    [self getData];
    [self.view addSubview:self.tableView];
}

- (void)getData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
    
    [manager GET:@"http://www.yangruixin.com/test/apiForGuide.php?RequestType=Canteen" parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseobject) {
        NSDictionary *dic = responseobject;
        for (int i = 0; i < [dic[@"Data"] count]; i++) {
            self.descriptionArray[i] = dic[@"Data"][i][@"resume"];
            self.urlStrArray[i] = dic[@"Data"][i][@"url"][0];
            self.nameArray[i] = dic[@"Data"][i][@"name"];
        }
        [self.tableView reloadData];
        
    }failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
        NSLog(@"请求失败,error:%@", error);
    }];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MyTableViewCell" owner:nil options:nil] lastObject];;
    }
    NSString* encodedString = @"";
    if (self.urlStrArray) {
        encodedString = [self.urlStrArray[indexPath.row] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
        
        cell.nameLabel.text = self.nameArray[indexPath.row];
        cell.descriptionLabel.text = self.descriptionArray[indexPath.row];
    }
    [cell.myImageView sd_setImageWithURL:[NSURL URLWithString:encodedString] placeholderImage:[UIImage imageNamed:@"占位图"]];
    cell.myImageView.layer.cornerRadius = 3;
    cell.myImageView.layer.masksToBounds = YES;
    cell.secondNameLabel.hidden = YES;
    cell.SeparatorView.backgroundColor = [UIColor colorWithRed:235/255.0 green:240/255.0 blue:242/255.0 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.nameLabel.font = [UIFont systemFontOfSize:15];
    
    cell.secondNameLabel.font = [UIFont systemFontOfSize:13];
    cell.secondNameLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    cell.descriptionLabel.font = [UIFont systemFontOfSize:13];
    cell.descriptionLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    
    cell.myImageView.contentMode = UIViewContentModeScaleToFill;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 500;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.urlStrArray) {
        return self.urlStrArray.count;
    }
    else {
        return 6;
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
