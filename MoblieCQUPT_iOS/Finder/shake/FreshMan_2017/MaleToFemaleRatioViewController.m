//
//  MaleToFemaleRatioViewController.m
//  TestLayoutButton
//
//  Created by helloworld on 2017/8/5.
//  Copyright © 2017年 topkid. All rights reserved.
//

#import <AFNetworking.h>
#import "MaleToFemaleRatioViewController.h"

@interface MaleToFemaleRatioViewController ()<UIPickerViewDelegate, UIPickerViewDataSource>
@property NSMutableArray *array;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UIButton *collegeBtn;
@property (strong, nonatomic) UIToolbar *toolBar;
@property (strong, nonatomic) UIView *backgroundGrayView;//遮盖来显示灰色的view
@property (strong, nonatomic) UIView *rootView;//放置toolBar和pickerView的view
@property (strong, nonatomic) UIView *blueView;//pickerView每一个cell的背景色view
@property NSInteger didSeclecter;

@end

@implementation MaleToFemaleRatioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *animateView = [[UIView alloc] initWithFrame:CGRectMake(50, 200, 194, 168)];
    animateView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:animateView];
    
    [self layoutPickerView];
    [self layoutCollegeButton];
}


- (void)layoutCollegeButton {
    UIButton *btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor colorWithRed:235/255.0 green:245/255.0 blue:250/255.0 alpha:1.0];
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:1.0].CGColor;
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.layer.cornerRadius = 20;
    
    [btn setTitle:@"请选择学院" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] forState:UIControlStateNormal];
    //左对齐
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //让向右偏移16像素，不会紧贴着很难看
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 16, 0, 0);
    
    [btn addTarget:self action:@selector(tapCollegeBtn) forControlEvents:UIControlEventTouchUpInside];
    
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [btn setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.5] forState:UIControlStateNormal];

    
    [self.view addSubview:btn];
    self.collegeBtn = btn;
    
/*
    输出显示这两个值为0
    实际值
    self.navigationController.navigationBar.frame.size.height = 44
    [[TopTabView alloc] init].frame.size.height = 47
    状态栏20

    double top = 131 - [[TopTabView alloc] init].frame.size.height - self.navigationController.navigationBar.frame.size.height - 20;
*/
    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:137 - 44 - 47- 20];
    [self.view addConstraint:topConstraint];
    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:18];
    [self.view addConstraint:leftConstraint];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-18];
    [self.view addConstraint:rightConstraint];

    
    double height = 41 / 340.0 * ([UIScreen mainScreen].bounds.size.width - 36);
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:btn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:height];
    [self.view addConstraint:heightConstraint];
}


- (void)tapCollegeBtn {
//获取window
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.backgroundGrayView= [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.backgroundGrayView.backgroundColor = [UIColor brownColor];
    
//创建遮盖view
    self.backgroundGrayView = [[UIView alloc] init];
    [window addSubview:self.backgroundGrayView];
    self.backgroundGrayView.translatesAutoresizingMaskIntoConstraints = NO;
    self.backgroundGrayView.backgroundColor = [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:0.7];
    
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:self.backgroundGrayView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:[UIScreen mainScreen].bounds.size.height - self.rootView.bounds.size.height];
    [self.backgroundGrayView addConstraint:height];
    
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:self.backgroundGrayView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:[UIScreen mainScreen].bounds.size.width];
    [self.backgroundGrayView addConstraint:width];
    
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:self.backgroundGrayView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:window attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-self.pickerView.bounds.size.height];
    [window addConstraint:bottom];

//显示选择器界面
    self.pickerView.hidden = NO;
    self.toolBar.hidden = NO;
    self.blueView.hidden = NO;
    
#pragma mark - 手势
//添加返回手势
    UITapGestureRecognizer *tapToBackGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapToBackAction)];
    [self.backgroundGrayView addGestureRecognizer:tapToBackGesture];
}

- (void)tapToBackAction {
    NSInteger i = [self.pickerView selectedRowInComponent:0];
    NSLog(@"----> %ld", (long)i);
    if (self.pickerView.hidden == YES) {
        ;
    }
    else {
        self.pickerView.hidden = YES;
        self.toolBar.hidden = YES;
        self.blueView.hidden = YES;
    }
    
    [self.backgroundGrayView removeFromSuperview];
}

- (void)tapPickerBtn {
    if (self.pickerView.hidden == YES) {
        ;
    }
    else {
        self.pickerView.hidden = YES;
        self.toolBar.hidden = YES;
        self.blueView.hidden = YES;
    }
    
    [self.backgroundGrayView removeFromSuperview];
    
    NSInteger i = [self.pickerView selectedRowInComponent:0];

#pragma mark - 网络请求
//网络请求
//    NSDictionary *parameters = @{
//                                 @"RequestType":@"SexRatio"
//                                 };
//    
//    NSString *url = @"http://www.yangruixin.com/test/apiRatio.php";
//    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFJSONResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"text/plain", nil];
//    [manager POST:url parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseobject) {
//            NSDictionary *dic = responseobject;
//            NSLog(@"%@", dic);
//    }failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {
//        NSLog(@"请求失败,error:%@", error);
//    }];
}


- (void)layoutPickerView {
    
#pragma mark - rootView
//    pickerView和toolBar放在这一个view上
    UIView *rootView = [[UIView alloc] init];
    rootView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:rootView];
    self.rootView = rootView;
    
//布局rootView
    double height = 226 / 375.0 * [UIScreen mainScreen].bounds.size.width;

    NSLayoutConstraint *widthConstraint1 = [NSLayoutConstraint constraintWithItem:rootView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:[UIScreen mainScreen].bounds.size.width];
    [rootView addConstraint:widthConstraint1];
    
    
    NSLayoutConstraint *heightConstraint1 = [NSLayoutConstraint constraintWithItem:rootView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:height];
    [rootView addConstraint:heightConstraint1];
    
    NSLayoutConstraint *bottomConstraint1 = [NSLayoutConstraint constraintWithItem:rootView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:bottomConstraint1];
    
//创建背景 一条蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.hidden = YES;
    blueView.backgroundColor = [UIColor colorWithRed:101/255.0 green:178/255.0 blue:255/255.0 alpha:1];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [rootView addSubview:blueView];
    self.blueView = blueView;
    
    NSLayoutConstraint *widthCons = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:[UIScreen mainScreen].bounds.size.width];
    [blueView addConstraint:widthCons];
    
    NSLayoutConstraint *heightCons = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:35];
    [blueView addConstraint:heightCons];
    
    NSLayoutConstraint *topCons = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:height/2.0 - 35/2.0];
    [rootView addConstraint:topCons];

    
#pragma mark - pickerView
//创建pickerView
    UIPickerView *pickerView = [[UIPickerView alloc] init];
//    pickerView.alpha = 0.3;
//不影响子视图透明度用[UIColor colorWithRed:1 green:1 blue:1 alpha:0.3]设置透明度
    pickerView.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.3];
    pickerView.translatesAutoresizingMaskIntoConstraints = NO;
    pickerView.hidden = YES;
    pickerView.showsSelectionIndicator = NO;
    pickerView.delegate = self;
    pickerView.dataSource = self;
    self.pickerView = pickerView;
    [rootView addSubview:pickerView];
    
    
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:pickerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:[UIScreen mainScreen].bounds.size.width];
    [pickerView addConstraint:widthConstraint];
    
    
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:pickerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:height];
    [pickerView addConstraint:heightConstraint];
    
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:pickerView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [self.view addConstraint:bottomConstraint];
    
    
#pragma mark - toolBar
//完成按钮放工具栏
    UIToolbar *toolBar = [[UIToolbar alloc] init];
//    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 375, 35)];
    toolBar.translatesAutoresizingMaskIntoConstraints = NO;
    [rootView addSubview:toolBar];
    toolBar.barTintColor = [UIColor whiteColor];
    toolBar.clearsContextBeforeDrawing = YES;
    toolBar.hidden = YES;
    self.toolBar = toolBar;

    
    NSLayoutConstraint *widthConstraint2 = [NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:[UIScreen mainScreen].bounds.size.width];
    [toolBar addConstraint:widthConstraint2];
    
    
    NSLayoutConstraint *heightConstraint2 = [NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:40];
    [toolBar addConstraint:heightConstraint2];
    
    NSLayoutConstraint *topConstraint2 = [NSLayoutConstraint constraintWithItem:toolBar attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:rootView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    [rootView addConstraint:topConstraint2];
    
    
#pragma mark - toolBar's button
//toolBar上添加一个button
    UIButton *toolBtn = [[UIButton alloc] init];
    toolBtn.translatesAutoresizingMaskIntoConstraints = NO;
    toolBtn.backgroundColor = [UIColor whiteColor];
    [toolBtn setTitle:@"完成" forState:UIControlStateNormal];
    [toolBar addSubview:toolBtn];
    [toolBtn setTitleColor:[UIColor colorWithRed:129/255.0 green:192255.0 blue:254/255.0 alpha:1] forState:UIControlStateNormal];
    toolBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [toolBtn addTarget:self action:@selector(tapPickerBtn) forControlEvents:UIControlEventTouchUpInside];
    
    NSLayoutConstraint *widthConstraint3 = [NSLayoutConstraint constraintWithItem:toolBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:39];
    [toolBtn addConstraint:widthConstraint3];
    
    
    NSLayoutConstraint *heightConstraint3 = [NSLayoutConstraint constraintWithItem:toolBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:24];
    [toolBtn addConstraint:heightConstraint3];
    
    NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:toolBtn attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:toolBar attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    [toolBar addConstraint:right];
    
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:toolBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:toolBar attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
    [toolBar addConstraint:top];
}

//1个表盘
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}


//指定每个表盘上有几行数据
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 8;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40;
}

//- (NSString *)pickerView:(UIPickerView *)pickerView
//titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    return @"jjkl";;
//}


//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    
//    NSDictionary * attrDic = @{NSForegroundColorAttributeName:[UIColor blueColor]};
//    
//    NSAttributedString * attrString = [[NSAttributedString alloc] initWithString:@"123"                         attributes:attrDic];
//    return attrString;
//}


- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UIView *myView= [[UIView alloc]init];
    myView.backgroundColor= [UIColor clearColor];
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.text = @"hahahahahahah";
    myLabel.translatesAutoresizingMaskIntoConstraints = NO;
    myLabel.textAlignment = NSTextAlignmentCenter;
    myLabel.font = [UIFont systemFontOfSize:14];
    [myView addSubview:myLabel];
    
//选中行改变颜色、字体大小
    if (self.didSeclecter == row) {
        myLabel.textColor = [UIColor whiteColor];
        myLabel.font = [UIFont systemFontOfSize:17];
    }
    else {
        myLabel.textColor = [UIColor grayColor];
    }


    
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
    [myView addConstraint:leftConstraint];
    
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [myView addConstraint:rightConstraint];


    
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeTop multiplier:1.0 constant:9];
        [myView addConstraint:topConstraint];
        
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:myLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:myView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [myView addConstraint:bottomConstraint];

    for (UIView *view in pickerView.subviews) {
        if (view.frame.size.height<1) {
            view.backgroundColor = [UIColor clearColor];
        }
    }

    return myView;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    UIView *firstView = [pickerView viewForRow:0 forComponent:component];
//    UIView *v = [pickerView viewForRow:row forComponent:component];
//    v.backgroundColor = [UIColor colorWithRed:101/255.0 green:178/255.0 blue:255/255.0 alpha:1.0];
//    
//    UIView *v2 = [pickerView viewForRow:row + 1 forComponent:component];
//    v2.backgroundColor = [UIColor colorWithRed:101/255.0 green:178/255.0 blue:255/255.0 alpha:1.0];
//    
//    UIView *v0 = [pickerView viewForRow:row-1 forComponent:component];
//    v0.backgroundColor = [UIColor colorWithRed:101/255.0 green:178/255.0 blue:255/255.0 alpha:1.0];

    self.didSeclecter = row;
    [self.pickerView reloadAllComponents];
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
