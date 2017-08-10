//
//  MyTableViewCell.h
//  MoblieCQUPT_iOS
//
//  Created by helloworld on 2017/8/10.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
- (CGFloat)height;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
- (void)setData;

@end
