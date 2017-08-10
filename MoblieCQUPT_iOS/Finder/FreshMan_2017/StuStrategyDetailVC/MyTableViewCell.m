//
//  MyTableViewCell.m
//  MoblieCQUPT_iOS
//
//  Created by helloworld on 2017/8/10.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView {
    static NSString *ID = @"cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    }
    return cell;
}

- (void)setData {
    self.nameLabel.text = @"王二";
    self.descriptionLabel.text = @"asfdasefsagesdargerdsaghdsthgfdfqeqwertyuiopasdfghjklzxcvbnmqadssgbhwazegjnidurhncgfdgbhnusdixzobjgfd";
}

- (CGFloat)height {
    return CGRectGetMaxY(self.descriptionLabel.frame) + 13;
}
@end
