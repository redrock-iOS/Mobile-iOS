//
//  StuBedroomCellTableViewCell.m
//  MoblieCQUPT_iOS
//
//  Created by helloworld on 2017/8/10.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "StuBedroomCellTableViewCell.h"

@implementation StuBedroomCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (CGFloat)height {
    return CGRectGetMaxY(self.descriptionLabel.frame) + 13;
}

- (StuBedroomCellTableViewCell *)cell:(StuBedroomCellTableViewCell *)cell IndexPath:(NSIndexPath *)indexPath{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.nameLabel.text = @"233";
    cell.numberLabel.text = @"asfsfasd";
    if (indexPath.row == 1) {
        cell.descriptionLabel.text = @"sdjagfvsdkvafjvsjfvskjdavfbdjkvfbdjzkfbauvfsjvfuaBKufgvbuzsjbkfjhsdkzgbuzdsgsdthrdtgdrfgdjhgkbdsjkgbjzsgbfdskbgiudxgbudsbgudkbrgkdxubguftgbdxjkbgjdxkbgurkbgdjzbfgseibgdizlbgiseurgbdjkbgjdxbgjksbzdjfgkbsgesdubrfgkdzrgiuerlsnkxjfbgvnirlbgnzdjklbngfiseulbgkjdlnfgiueslgndzfilbgn";
    }
    else {
        cell.descriptionLabel.text = @"哈哈";
    }
    
    return cell;
}

@end
