//
//  AppearView.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/8.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "AppearView.h"
#import "PrefixHeader.pch"
#import "UIImage+Circle.h"
#import "Masonry.h"
@interface AppearView()
@property NSString *string;
@property UIImage *image;
@end
@implementation AppearView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect )frame WithString:(NSString *) string AndContext:(NSString *)context{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:189/255.0  green:189/255.0 blue:189/255.0 alpha:0.5];
        UIView *displayView = [[UIView alloc] init];
        displayView.center = self.center;
        displayView.backgroundColor = [UIColor whiteColor];
        displayView.layer.cornerRadius = 6;

        _closeImage = [[UIImageView alloc] init];
        _closeImage.image = [UIImage imageNamed:@"close"];
 
        [displayView addSubview:_closeImage];
        
        UIImageView *peopleImage = [[UIImageView alloc] init];
        [peopleImage setContentScaleFactor:[[UIScreen mainScreen] scale]];
//        peopleImage.contentMode =  UIViewContentModeScaleAspectFill;
        peopleImage.image = [UIImage cutCircleImage:string];
        [displayView addSubview:peopleImage];
        
        UILabel *nameText = [[UILabel alloc]init];
        nameText.text = string;
        nameText.textAlignment = 1;
        nameText.font = [UIFont systemFontOfSize:17];
        [displayView addSubview:nameText];
        
        UILabel *StringText = [[UILabel alloc]init];
        StringText.font = [UIFont systemFontOfSize:13];
        StringText.text = context;
        StringText.numberOfLines = 0;
        [StringText sizeToFit];
        [displayView  addSubview:StringText];
        [self addSubview:displayView];

        [displayView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self);
            make.centerY.mas_equalTo(self);
            make.left.mas_equalTo(self.mas_left).offset(59);
            make.right.mas_equalTo(self.mas_right).offset(-59);
            make.top.mas_equalTo(self.mas_top).offset(161);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-161);
        }];
        
        [_closeImage mas_makeConstraints:^(MASConstraintMaker *make) {

            make.right.mas_equalTo(displayView.mas_right).offset(-10);
            make.top.mas_equalTo(displayView.mas_top).offset(10);
            make.height.mas_equalTo(@23);
            make.width.mas_equalTo(@23);
        }];
        
        [peopleImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(displayView);
            make.height.mas_equalTo(@100);
            make.width.mas_equalTo(@100);
            make.top.mas_equalTo(_closeImage.mas_bottom).offset(10);
        }];
        
        [nameText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@20);
            make.centerX.mas_equalTo(displayView);
            make.top.mas_equalTo(peopleImage.mas_bottom).offset(10);
        }];
        
        [StringText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(@140);
            make.left.mas_equalTo(displayView.mas_left).offset(10);
            make.right.mas_equalTo(displayView.mas_right).offset(-10);
            make.top.mas_equalTo(nameText.mas_bottom).offset(10);
        }];
        

    }
    return self;
}

@end
