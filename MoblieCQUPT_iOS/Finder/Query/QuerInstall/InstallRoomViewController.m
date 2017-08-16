//
//  InstallRoomViewController.m
//  Query
//
//  Created by hzl on 2017/3/8.
//  Copyright © 2017年 c. All rights reserved.
//

#import "InstallRoomViewController.h"
#import "InstallBuildTableViewCell.h"
#import "QuerLoginViewController.h"
#import "InstallRoomDoneViewController.h"
#import "AppDelegate.h"
#define font(R) (R)*([UIScreen mainScreen].bounds.size.width)/375.0


CG_INLINE CGRect
CHANGE_CGRectMake(CGFloat x, CGFloat y,CGFloat width,CGFloat height){

    CGRect rect;
    rect.origin.x = x * autoSizeScaleX;
    rect.origin.y = y * autoSizeScaleY;
    rect.size.width = width * autoSizeScaleY;
    rect.size.height = height * autoSizeScaleY;
    return rect;
}

@interface InstallRoomViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UILabel *buildLabel;

@property (nonatomic, strong) UITextField *roomTextField;

@property (nonatomic, strong) UIView *infoBigView;

@property (nonatomic, strong) UIView *unachieveBigView;

@property (nonatomic, strong) UIView *bigView;

@property (nonatomic, strong) UIButton *achieveBtn;

@end

@implementation InstallRoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:89/255.0 green:89/255.0 blue:89/255.0 alpha:1]};
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:89/255.0 green:89/255.0 blue:89/255.0 alpha:1];
    
    self.navigationItem.title = @"设置寝室";
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    tapGesture.delegate = self;
    [self.view addGestureRecognizer:tapGesture];
    
    [self addTitleView];
    [self addRoomIcon];
    [self addBuildIcon];
    [self addbuildLabel];
    [self addRoomTextField];
    [self addachieveBtn];
}

- (void)hideKeyBoard{
    [[[UIApplication sharedApplication]keyWindow]endEditing:YES];
}

- (void)addTitleView{
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"querElecIcon.png"]];
    titleView.frame = CHANGE_CGRectMake(0, 64, 375, 300);
    titleView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:titleView];
}

- (void)addbuildLabel{
    _buildLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.7];
    _buildLabel = [[UILabel alloc] initWithFrame:CHANGE_CGRectMake(82, 425, 250, 20)];
    _buildLabel.font = [UIFont systemFontOfSize:font(16)];
    _buildLabel.text = @"请选择楼栋数";
    _buildLabel.textAlignment = NSTextAlignmentLeft;
    _buildLabel.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    _buildLabel.userInteractionEnabled = YES;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showBuildTableView)];
    [_buildLabel addGestureRecognizer:tapGesture];
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CHANGE_CGRectMake(82, 447.5, 250, 1)];
    lineLabel.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.7];
    
    UIImageView *arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"angleImage.png"]];
    arrowView.contentMode = UIViewContentModeScaleToFill;
    arrowView.frame = CHANGE_CGRectMake(311.5, 430, 15, 10);
    
    [self.view addSubview:arrowView];
    [self.view addSubview:lineLabel];
    [self.view addSubview:_buildLabel];
}

- (void)addRoomTextField{
    
    NSMutableAttributedString *placeholder = [[NSMutableAttributedString alloc] initWithString:@"寝室号(三位数)" attributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]}];
    [placeholder addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font(16)]} range:NSMakeRange(0, placeholder.length)];
    
    _roomTextField = [[UITextField alloc] initWithFrame:CHANGE_CGRectMake(82, 475, 250, 20)];
    _roomTextField.textAlignment = NSTextAlignmentLeft;
    _roomTextField.font = [UIFont systemFontOfSize:font(16)];
    _roomTextField.attributedPlaceholder = placeholder;
    _roomTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    _roomTextField.textColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1];
    _roomTextField.delegate = self;
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CHANGE_CGRectMake(82, 497.5, 250, 1)];
    lineLabel.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.7];
    
    [self.view addSubview:lineLabel];
    [self.view addSubview:_roomTextField];
}


- (void)addachieveBtn{
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc] initWithString:@"确 定" attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [content addAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font(21)]} range:NSMakeRange(0, content.length)];
    
    _achieveBtn = [[UIButton alloc] initWithFrame:CHANGE_CGRectMake(43.5, 544.5, 288,46)];
    [_achieveBtn setAttributedTitle:content forState:UIControlStateNormal];
    _achieveBtn.backgroundColor = [UIColor colorWithRed:18/255.0 green:185/255.0 blue:255/255.0 alpha:1];
    
    _achieveBtn.layer.cornerRadius = 23;
    _achieveBtn.layer.masksToBounds = YES;
    
    [_achieveBtn addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:_achieveBtn];
}



- (void)saveData{
    if (_roomTextField.text.length!=3||_buildLabel.text.length!=3) {
        [self showInfoView];
    }else{
        NSDate *currentDate = [NSDate date];
        
        NSCalendar *calendar = [NSCalendar currentCalendar];
        
        NSDateComponents *compoent = [calendar components:NSCalendarUnitMonth fromDate:currentDate];
        
        NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = pathArray[0];
        NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"RoomAndBuild.plist"];
        NSMutableDictionary *data = [[NSMutableDictionary alloc] init];
            [data setObject:[NSString stringWithFormat:@"%@",_roomTextField.text] forKey:@"room"];
            [data setObject:[NSString stringWithFormat:@"%@",[_buildLabel.text substringWithRange:NSMakeRange(0, 2)]] forKey:@"build"];
        [data setObject:[NSString stringWithFormat:@"%@",compoent] forKey:@"month"];
            [data writeToFile:plistPath atomically:YES];
        
        [self pushToDoneVC];
    }
    
}

- (void)pushToDoneVC{
    InstallRoomDoneViewController *irdVC = [[InstallRoomDoneViewController alloc] init];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem  alloc]  initWithTitle:@"返回"style:UIBarButtonItemStylePlain  target:nil  action:nil];
    [self.navigationController pushViewController:irdVC animated:YES];
}

- (void)showInfoView{
    _infoBigView = [[UIView alloc] initWithFrame:CHANGE_CGRectMake(0, 0, 375, 667)];
    _infoBigView.backgroundColor = [UIColor colorWithRed:57/255.0 green:57/255.0 blue:57/255.0 alpha:0.7];
    
    UIView *achieveView = [[UIView alloc] initWithFrame:CHANGE_CGRectMake(31, 174.5, 313, 319)];
    achieveView.layer.cornerRadius = 12;
    achieveView.layer.masksToBounds = YES;
    achieveView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"achieveImage.png"]];
    imageView.frame = CHANGE_CGRectMake(0, 0, 313, 187.5);
    
    UILabel *infoLabel = [[UILabel alloc] initWithFrame:CHANGE_CGRectMake(100.5, 213.5, 116, 20)];
    infoLabel.font = [UIFont systemFontOfSize:font(17)];
    infoLabel.textColor = [UIColor colorWithRed:119/255.0 green:119/255.0 blue:119/255.0 alpha:1];
    infoLabel.backgroundColor = [UIColor clearColor];
    infoLabel.text = @"请将信息填写完整";
    infoLabel.textAlignment = NSTextAlignmentLeft;
    infoLabel.adjustsFontSizeToFitWidth = YES;
    infoLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    infoLabel.contentMode = UIViewContentModeRedraw;
    
    UIButton *achieveBtn = [[UIButton alloc] initWithFrame:CHANGE_CGRectMake(31, 264, 252, 41.5)];
    achieveBtn.backgroundColor = [UIColor colorWithRed:18/255.0 green:185/255.0 blue:255/255.0 alpha:1];
    [achieveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [achieveBtn setTitle:@"确 定" forState:UIControlStateNormal];
    [achieveBtn addTarget:self action:@selector(removeInfoBigView) forControlEvents:UIControlEventTouchDown];
    achieveBtn.layer.cornerRadius = 5;
    achieveBtn.layer.masksToBounds = YES;
    
    [achieveView addSubview:imageView];
    [achieveView addSubview:infoLabel];
    [achieveView addSubview:achieveBtn];
    
    [_infoBigView addSubview:achieveView];
    [self.view addSubview:_infoBigView];
}

- (void)removeInfoBigView{
    _infoBigView.hidden = YES;
    _infoBigView = nil;
}


- (void)addBuildIcon{
    UIImageView *buildView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buildIcon.png"]];
    buildView.frame = CHANGE_CGRectMake(43.5, 425, 18, 19);
    buildView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:buildView];
}

- (void)addRoomIcon{
    UIImageView *roomView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"roomIcon.png"]];
    roomView.frame = CHANGE_CGRectMake(43.5, 476, 18, 19);
    [self.view addSubview:roomView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 39;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    InstallBuildTableViewCell *cell = [InstallBuildTableViewCell tableView:tableView cellForRowAtIndexPath:indexPath];
    _buildLabel.text = cell.buildLabel.text;
    [self removeView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 43;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    InstallBuildTableViewCell *cell = [InstallBuildTableViewCell tableView:tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row + 1 < 10) {
        cell.buildLabel.text = [NSString stringWithFormat:@"0%ld栋",(long)indexPath.row+1];
    }else{
        cell.buildLabel.text = [NSString stringWithFormat:@"%ld栋",(long)indexPath.row+1];
    }
     return cell;
}

- (void)showBuildTableView{
    _tableView = [[UITableView alloc] initWithFrame:CHANGE_CGRectMake(0,359.5 , 375, 307.5) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
        _bigView = [[UIView alloc] initWithFrame:CHANGE_CGRectMake(0, 0, 375, 667)];
        _bigView.backgroundColor = [UIColor colorWithRed:57/255.0 green:57/255.0 blue:57/255.0 alpha:0.1];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeView)];
    tapGesture.delegate = self;
    [_bigView addGestureRecognizer:tapGesture];
    
    
    [_bigView addSubview:_tableView];
    [self.view addSubview:_bigView];
}

- (void)removeView{
    _bigView.hidden = YES;
    _bigView = nil;
    _tableView = nil;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    if ([touch.view isKindOfClass:[UITableView class]]){
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
