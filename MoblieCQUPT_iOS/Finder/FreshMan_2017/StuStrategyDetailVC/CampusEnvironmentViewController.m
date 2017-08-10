//
//  CampusEnvironmentViewController.m
//  TestLayoutButton
//
//  Created by helloworld on 2017/8/4.
//  Copyright © 2017年 topkid. All rights reserved.
//

#import "CampusEnvironmentCell.h"
#import "CampusEnvironmentViewController.h"

@interface CampusEnvironmentViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *nameArray;
@property (strong, nonatomic) NSArray *descriptionArray;

@end

@implementation CampusEnvironmentViewController

//用到的时候才加载
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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.nameArray = [[NSArray alloc] initWithObjects:@"巍巍南山，美丽重邮", @"科创信科楼", @"数字图书馆", @"夕阳下的二教", @"高山流水", @"雨红莲", @"仰望八教", nil];
    self.descriptionArray = [[NSArray alloc] initWithObjects:@"站在腾飞广场，做着属于我们的腾飞梦，从这一刻便开启了你的大学新篇章。秉持“修德、博学、求实、创新”校训，书写你的重邮梦。很高兴能与你在重邮相遇。", @"挑战杯、创青春、互联网+、数模……在各类创新创业竞赛中，都可以看到重邮人的身影，他们不断地充实着大学生活，和重邮人在一起，自己在会变得更好。", @"在这里，时间变慢，重邮人的脚步变快。从图书馆开门到熄灯，总会看到埋头学习的重邮人，一整天都可以在窗户透过的光芒里，全神贯注。没错，爱学习的重邮人最好看啦！", @"伴着余晖，二教像披着一层朦胧的纱幔，金黄的银杏叶妆点着她的美。漫步在春华秋实广场，邂逅一场邮苑专属浪漫。", @"在重邮信科楼旁的高山流水只是简单一个缩影，却包含了重邮学子的内心广阔。流水溅射过青松，把一切都转换为学子的高山俯仰之情。", @"红砖绿荫的映衬下的雨红莲，是重邮人的活动聚集地。丰富的校园活动常常在这里开展，洋着重邮人的活力，展示重邮浓厚的校园文化。", @"八教是传媒艺术学院的学子艺术灵感的发源地，创意在这里闪亮聚集，也是重邮人乘风破浪，扬帆起航的象征。勇敢追梦吧，重邮学子们。", nil];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idStr = @"cell";
    CampusEnvironmentCell *cell = [tableView dequeueReusableCellWithIdentifier:idStr];
    
    if (!cell) {
        cell = [[CampusEnvironmentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idStr];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.myImageView.contentMode = UIViewContentModeScaleToFill;
    cell.myImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld", (long)indexPath.row]];
    NSMutableAttributedString *nameStr = [[NSMutableAttributedString alloc] initWithString:self.nameArray[indexPath.row]];
    [nameStr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFang-SC-Medium" size:15.0] range:NSMakeRange(0, 2)];
    cell.nameLabel.text = self.nameArray[indexPath.row];
    cell.descriptionLabel.text = self.descriptionArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 343 / 375.0 * [UIScreen mainScreen].bounds.size.width;
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
