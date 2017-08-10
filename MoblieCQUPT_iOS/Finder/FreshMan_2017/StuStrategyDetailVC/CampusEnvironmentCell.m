//
//  CampusEnvironmentCell.m
//  MoblieCQUPT_iOS
//
//  Created by helloworld on 2017/8/8.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "CampusEnvironmentCell.h"

#define KHEIGHT [UIScreen mainScreen].bounds.size.height
#define KWIDTH [UIScreen mainScreen].bounds.size.width

@implementation CampusEnvironmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initSubCell];
    }
    
    return self;
}

- (void)initSubCell {
    self.grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KWIDTH, 8)];
    self.grayView.backgroundColor = [UIColor colorWithRed:235/255.0 green:240/255.0 blue:242/255.0 alpha:1];
    [self.contentView addSubview:self.grayView];
    
    
    self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(18, 18 + 8, KWIDTH - 36, 180/340.0 * (KWIDTH - 36))];
    [self.contentView addSubview:self.myImageView];
    
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 180/340.0 * (KWIDTH - 36) + 39, KWIDTH - 36, 15)];
    self.nameLabel.backgroundColor = [UIColor whiteColor];
    self.nameLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    [self.contentView addSubview:self.nameLabel];
 
    self.descriptionLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 180/340.0 * (KWIDTH - 36) + 39 + 14 + 9, KWIDTH - 36, 86)];
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.font = [UIFont systemFontOfSize:13.0];
    self.descriptionLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    self.descriptionLabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.descriptionLabel];
}

@end
