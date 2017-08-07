//
//  IntallFailViewController.m
//  Query
//
//  Created by hzl on 2017/3/13.
//  Copyright © 2017年 c. All rights reserved.
//

#import "IntallFailViewController.h"
#import "AppDelegate.h"

#define font(R) (R)*([UIScreen mainScreen].bounds.size.width)/375.0

CG_INLINE CGRect
CHANGE_CGRectMake(CGFloat x, CGFloat y,CGFloat width,CGFloat height){

    CGRect rect;
    rect.origin.x = x * autoSizeScaleX;
    rect.origin.y = y * autoSizeScaleY;
    rect.size.width = width * autoSizeScaleY;
    rect.size.height = height * autoSizeScaleY;
    return rect;
}

@interface IntallFailViewController ()

@end

@implementation IntallFailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:89/255.0 green:89/255.0 blue:89/255.0 alpha:1]};
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:89/255.0 green:89/255.0 blue:89/255.0 alpha:1];
    
    [self addTitleView];
    [self addDormitoryLabel];
    [self addInfoLabel];
}

- (void)addTitleView{
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"reinstallImage.png"]];
    titleView.frame = CHANGE_CGRectMake(0, 64, 375, 300);
    titleView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:titleView];
}

- (void)addDormitoryLabel{
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = pathArray[0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"RoomAndBuild.plist"];
    NSMutableDictionary *dataDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CHANGE_CGRectMake(101.5, 455, 175, 16)];
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"当前设置寝室:%@栋%@",dataDic[@"build"],dataDic[@"room"]] attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:17/255.0 green:188/255.0 blue:255/255.0 alpha:1]}];
    [content addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1]} range:NSMakeRange(0, 6)];
    [content addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font(16)]} range:NSMakeRange(0, content.length)];
    
    label.attributedText = content;
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    label.backgroundColor = [UIColor clearColor];
    [self.view addSubview:label];
}

- (void)addInfoLabel{
    UILabel *label = [[UILabel alloc] initWithFrame:CHANGE_CGRectMake(62, 486, 275, 16)];
    label.text = @"每月只能设置一次寝室,本月已设置";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor colorWithRed:157/255.0 green:157/255.0 blue:157/255.0 alpha:1];
    label.textAlignment = UIViewContentModeCenter;
    
    [label setFont:[UIFont systemFontOfSize:font(15)]];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:label];
    
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
