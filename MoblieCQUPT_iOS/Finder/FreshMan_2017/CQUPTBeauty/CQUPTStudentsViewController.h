//
//  CQUPTStudentsViewController.h
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/7.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CQUPTStudentsViewController : UIViewController
@property (strong, nonatomic)NSArray *contextArray;
- (void)getTheStudentsName:(NSArray *)name AndContext:(NSArray *) context;
@end
