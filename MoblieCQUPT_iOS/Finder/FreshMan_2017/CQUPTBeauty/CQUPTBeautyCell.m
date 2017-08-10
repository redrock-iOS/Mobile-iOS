//
//  CQUPTBeautyCell.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/8.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "CQUPTBeautyCell.h"
#import "Masonry.h"
@implementation CQUPTBeautyCell
- (void)awakeFromNib {
    [super awakeFromNib];

}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _imagesView = [[UIImageView alloc]init];
        [self.contentView addSubview:_imagesView];
        _imagesView.contentMode = UIViewContentModeScaleAspectFill;
        
        UILabel *namesLabel = [[UILabel alloc] init];
        [self.contentView addSubview:namesLabel];
        
        _contextLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_contextLabel];
        
        [_imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView).offset(15);
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(self.contentView).offset(-15);
            make.left.mas_equalTo(self.contentView).offset(15);
        }];
        
        [namesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_imagesView.mas_bottom).offset(10);
            make.centerY.mas_equalTo(self.contentView);
            make.right.mas_equalTo(self.contentView).offset(-15);
            make.left.mas_equalTo(self.contentView).offset(15);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        }];
    }
    return self;
}
-(void)setContextLabelText:(NSString *)text{
    CGRect frame = self.frame;
    self.contextLabel.text = text;
    
    self.contextLabel.numberOfLines = 0;
    
    CGSize size = CGSizeMake(300, 1000);
    CGSize labelSize  = [self.contextLabel.text sizeForFont:self.contextLabel.font size:size mode:NSLineBreakByClipping];
    frame.size.height = labelSize.height + 100;
    self.frame = frame;
    
}
-(void)setFrame:(CGRect)frame{
    
    frame.origin.y += 6;

    frame.size.height -= 2;
    
    [super setFrame:frame];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
