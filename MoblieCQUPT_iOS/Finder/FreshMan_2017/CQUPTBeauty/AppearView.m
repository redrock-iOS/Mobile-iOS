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
- (instancetype)initWithFrame:(CGRect )frame WithString:(NSString *) string With:(UIImage *)image{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:189/255.0  green:189/255.0 blue:189/255.0 alpha:0.2];
        UIView *displayView = [[UIView alloc] init];
        displayView.center = self.center;
        displayView.backgroundColor = [UIColor whiteColor];
        displayView.size = CGSizeMake(SCREENWIDTH - 118, SCREENHEIGHT - 322);
        
        UIImageView *closeImage = [[UIImageView alloc] initWithFrame:CGRectMake(displayView.frame.origin.x - 10, displayView.frame.origin.y - 10, 23, 23)];
        closeImage.image = [UIImage imageNamed:@"close"];
        [displayView addSubview:closeImage];
        
        UIImageView *peopleImage = [[UIImageView alloc] initWithFrame:CGRectMake(self.center.x, displayView.frame.origin.y + 23, 106, 106)];
        peopleImage.image = [UIImage cutCircleImage:@""];
        [displayView addSubview:peopleImage];
        
        UILabel *nameText = [[UILabel alloc]initWithFrame:CGRectMake(self.center.x, peopleImage.frame.origin.y + 106 + 12, 41, 13)];
        nameText.textAlignment = 20;
        [displayView addSubview:nameText];
        
        UILabel *StringText = [[UILabel alloc]initWithFrame:CGRectMake(self.center.x, nameText.frame.origin.y + 13 + 19, self.size.width - 42,self.size.width -nameText.frame.origin.y + 13)];
        StringText.textAlignment = 15;
        StringText.text = @"sdfasdfsadfasfdas";
        [displayView  addSubview:StringText];
        [self addSubview:displayView];

        
    }
    return self;
}
@end
