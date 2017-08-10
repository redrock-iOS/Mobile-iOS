//
//  StuBedroomCellTableViewCell.h
//  MoblieCQUPT_iOS
//
//  Created by helloworld on 2017/8/10.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StuBedroomCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *grayView;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (CGFloat)height;
- (StuBedroomCellTableViewCell *)cell:(StuBedroomCellTableViewCell *)cell IndexPath:(NSIndexPath *)indexPath;
@end
