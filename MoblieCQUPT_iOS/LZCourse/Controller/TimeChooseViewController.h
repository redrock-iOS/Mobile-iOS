//
//  TimeChooseViewController.h
//  Demo
//
//  Created by 李展 on 2016/11/26.
//  Copyright © 2016年 zhanlee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SaveDelegate.h"
@interface TimeChooseViewController : UIViewController
@property id <SaveDelegate>delegate;
- (instancetype)initWithTimeArray:(NSArray *)timeArray;
@end
