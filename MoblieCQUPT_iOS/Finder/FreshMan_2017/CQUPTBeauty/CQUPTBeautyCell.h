//
//  CQUPTBeautyCell.h
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/8.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQUPTBeautyCell : UITableViewCell
@property(strong, nonatomic) UILabel *contextLabel;
@property(strong, nonatomic) UIImageView *imagesView;
-(void)setContextLabelText:(NSString *)text;
@end
