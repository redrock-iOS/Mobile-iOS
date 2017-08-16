//
//  MBAddImageView.m
//  MoblieCQUPT_iOS
//
//  Created by GQuEen on 16/5/1.
//  Copyright © 2016年 Orange-W. All rights reserved.
//

#import "MBAddImageView.h"

@implementation MBAddImageView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupDeleteButton];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds = YES;
        self.userInteractionEnabled = YES;
        
        self.backgroundColor = [UIColor orangeColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapImageView)];
        [self addGestureRecognizer:tap];
        
    }
    return self;
}

- (void)tapImageView {
    NSLog(@"tap imageView ");
}

- (void)setupDeleteButton {
    UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGFloat width = 24;
    CGFloat height = 24;
    CGFloat x = kPhotoImageViewW- width+4;
    CGFloat y = -4;
    deleteBtn.frame = (CGRect){{x,y},{width,height}};
    deleteBtn.layer.cornerRadius = 4;
    deleteBtn.imageEdgeInsets = UIEdgeInsetsMake(2, -2, -2, 2);
    
    [deleteBtn setImage:[UIImage imageNamed:@"cancel.png"] forState:UIControlStateNormal];
    [deleteBtn addTarget:self action:@selector(clickDelete:) forControlEvents:UIControlEventTouchUpInside];
    deleteBtn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    [self addSubview:deleteBtn];
}

- (void)clickDelete:(UIButton *)sender {
    NSLog(@"点击删除");
    if ([self.delegate respondsToSelector:@selector(clickDelete:)]) {
        [self.delegate clickDelete:self];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
