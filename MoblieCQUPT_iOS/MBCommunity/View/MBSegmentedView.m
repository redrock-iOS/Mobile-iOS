//
//  MBSegmentedView.m
//  MoblieCQUPT_iOS
//
//  Created by GQuEen on 16/3/31.
//  Copyright © 2016年 Orange-W. All rights reserved.
//

#import "MBSegmentedView.h"
#import "MBCommunityTableView.h"

#define FONT_COLOR_GRAY [UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1]

@interface MBSegmentedView () <UIScrollViewDelegate>
@property (strong, nonatomic) UIButton *segmentBtn;
@property (strong, nonatomic) UIView *underLine;

@property (strong, nonatomic) UIButton *currentSelectBtn;
@property (assign, nonatomic) NSInteger currentBtnIndex;

@property (strong, nonatomic) NSMutableArray *segmentBtnArray;

@property (strong, nonatomic) UIView *superView;
@end

@implementation MBSegmentedView

- (instancetype)initWithFrame:(CGRect)frame withSegments:(NSArray *)segments{
    self = [super initWithFrame:frame];
    if (self) {
        //.........
        [self setupBaseView:segments];
        [self setupScrollView:segments];
    }
    
    return self;
}

#pragma mark -

#pragma mark 拼装segment:
- (void)setupBaseView:(NSArray *)segments {
    
    _superView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    
    UIView *segmentView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 45)];//标题segment的底view
    
    CGFloat kSegmentBtnWidth = ScreenWidth / segments.count;
    _segmentBtnArray = [NSMutableArray array];
    for (int i = 0; i < segments.count; i ++) {
        _segmentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_segmentBtn setTitle:(NSString *)segments[i] forState:UIControlStateNormal];
        if (i == 0) {
            _segmentBtn.selected = YES;
            _currentSelectBtn = self.segmentBtn;
        }
        _segmentBtn.tag = i;
        [_segmentBtn setTitleColor:FONT_COLOR_GRAY forState:UIControlStateNormal];
        [_segmentBtn setTitleColor:MAIN_COLOR forState:UIControlStateSelected];
        _segmentBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _segmentBtn.frame = CGRectMake(i*kSegmentBtnWidth, 0, kSegmentBtnWidth, segmentView.frame.size.height);
        [segmentView addSubview:self.segmentBtn];
        [_segmentBtn addTarget:self action:@selector(clickSegmentBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_segmentBtnArray addObject:self.segmentBtn];
    }
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, segmentView.frame.size.height - 0.5, ScreenWidth, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:0.5];
    
    _underLine = [[UIView alloc]initWithFrame:CGRectMake(0, segmentView.frame.size.height - 2, kSegmentBtnWidth, 2)];
    _underLine.backgroundColor = MAIN_COLOR;
    
    [self addSubview:self.superView];
    [_superView addSubview:segmentView];
    [segmentView addSubview:line];
    [segmentView addSubview:self.underLine];
}
#pragma mark -

#pragma mark 创建scrollView

- (void)setupScrollView:(NSArray *)segments {
    _backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 45, ScreenWidth, self.superView.frame.size.height - 45)];
    _backScrollView.showsHorizontalScrollIndicator = NO;
    _backScrollView.showsVerticalScrollIndicator = NO;
    _backScrollView.pagingEnabled = YES;
    _backScrollView.contentSize = CGSizeMake(segments.count*ScreenWidth, 0);
    _backScrollView.delegate = self;
    [_superView addSubview:self.backScrollView];
}

#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    _currentBtnIndex = (NSInteger)(self.backScrollView.contentOffset.x / ScreenWidth + 0.5);
    if (_currentBtnIndex != self.currentSelectBtn.tag) {
        _currentSelectBtn.selected = NO;
        _currentSelectBtn = self.segmentBtnArray[self.currentBtnIndex];
        _currentSelectBtn.selected = YES;
        if (self.clickSegmentBtnBlock) {
            self.clickSegmentBtnBlock(self.currentSelectBtn);
        }
        [UIView animateWithDuration:0.1 animations:^{
            _underLine.frame = CGRectMake(self.currentSelectBtn.frame.origin.x, self.underLine.frame.origin.y, self.underLine.frame.size.width, self.underLine.frame.size.height);
        } completion:nil];
    }
}

#pragma mark -

- (void)clickSegmentBtn:(UIButton *)sender {
    [self.backScrollView setContentOffset:CGPointMake(sender.tag*ScreenWidth, 0) animated:YES];
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
