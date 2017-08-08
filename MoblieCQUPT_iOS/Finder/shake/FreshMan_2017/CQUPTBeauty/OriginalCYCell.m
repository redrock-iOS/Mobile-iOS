//
//  OriginalCY.m
//  SegmentView
//
//  Created by xiaogou134 on 2017/8/4.
//  Copyright © 2017年 xiaogou134. All rights reserved.
//

#import "OriginalCYCell.h"
#import "PrefixHeader.pch"
@implementation OriginalCYCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:
            reuseIdentifier];
    if (self) {
        //添加控件
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, self.frame.size.height - 20, self.frame.size.height - 20)];
        [self.contentView addSubview: imageView];
        
        CGFloat wordWidth = imageView.frame.size.width + 20;
   
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(wordWidth, 20, self.frame.size.width - wordWidth, 20)];
        nameLabel.textColor = COLOR_NONEED;
        nameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:nameLabel];
 
        UILabel *detailLabel = [[UILabel alloc]initWithFrame:CGRectMake(wordWidth,nameLabel.frame.size.height + 20, self.frame.size.width - wordWidth, 40)];
        detailLabel.textColor = COLOR_NONEED;
        detailLabel.font = [UIFont systemFontOfSize:28];
        [self.contentView addSubview:detailLabel];
        
        UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(wordWidth,detailLabel.frame.size.height+ 20, self.frame.size.width - wordWidth, 20)];
        timeLabel.textColor = COLOR_NONEED;
        timeLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:timeLabel];
        
    }
    return self;
    
}

-(void)setFrame:(CGRect)frame{
    
    frame.origin.x = 20;
    
    frame.size.width -= 2* frame.origin.x;
    
    frame.size.height -= 10;
    
    [super setFrame:frame];
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
