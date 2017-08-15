//
//  SegmentView.m
//  GGSgmentView
//
//  Created by GQuEen on 16/8/7.
//  Copyright © 2016年 GegeChen. All rights reserved.
//
#import "SubSegementView.h"
#import "Masonry.h"
#define kTitleHeight (self.height*50/667)
@interface SubSegementView()<UIScrollViewDelegate>
@property NSArray <UIViewController *> *controllers;
@property UIScrollView *mainScrollView;
@property UIScrollView *titleScrollView;
@property UIView *sliderView;
@property NSInteger currentIndex;
@property CGFloat titleBtnWidth;
@property NSMutableArray <UIButton *> *btnArray;
@end

@implementation SubSegementView

- (instancetype)initWithFrame:(CGRect)frame andControllers:(NSArray <UIViewController *> *)controllers{
    self = [self initWithFrame:frame];
    if(self){
        self.controllers = controllers;
        if (self.controllers.count >=5) {
            self.titleBtnWidth = self.width/5;
        }
        else{
            self.titleBtnWidth = self.width/self.controllers.count;
        }
        [self initWithTitleView];
        [self initWithMainView];
    }
    return self;
    
}

- (void)initWithTitleView {
    _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.width, kTitleHeight)];
    _titleScrollView.contentSize = CGSizeMake(self.titleBtnWidth * self.controllers.count,kTitleHeight);
    _titleScrollView.bounces = NO;
    _titleScrollView.backgroundColor = [UIColor whiteColor];
    _titleScrollView.showsHorizontalScrollIndicator = NO;
    _titleScrollView.showsVerticalScrollIndicator = NO;
    [_titleScrollView flashScrollIndicators];
    
    _btnArray = [NSMutableArray<UIButton *> array];
    _sliderView = [[UIView alloc]initWithFrame:CGRectMake(0, kTitleHeight / 2 - 17, _titleBtnWidth, 34)];
    _sliderView.layer.cornerRadius = 6;
    _sliderView.backgroundColor = [UIColor colorWithRed:236/255.0 green:246/255.0 blue:255/255.0 alpha:0.8];
    _sliderView.opaque = NO;
    [_titleScrollView addSubview:self.sliderView];
    [self addSubview:self.titleScrollView];
    for (int i = 0; i < self.controllers.count; i ++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*self.titleBtnWidth, 0, self.titleBtnWidth, kTitleHeight);
        [btn setTitle:self.controllers[i].title forState:UIControlStateNormal];
        btn.tag = i;
        btn.titleLabel.font = [UIFont systemFontOfSize:15*SCREENWIDTH/375];
        [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1] forState:UIControlStateSelected];

        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_titleScrollView addSubview:btn];
        [_btnArray addObject:btn];
    }
    _currentIndex = 0;
    [_btnArray firstObject].selected = YES;
 
}

- (void)initWithMainView {
    _mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kTitleHeight, self.width, self.height-kTitleHeight)];
    _mainScrollView.showsHorizontalScrollIndicator = NO;
    _mainScrollView.showsVerticalScrollIndicator = NO;
    _mainScrollView.scrollEnabled = NO;
    _mainScrollView.contentSize = CGSizeMake(self.controllers.count*self.width, 0);
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.bounces = NO;
    _mainScrollView.delegate = self;
    
    for (int i = 0; i < _controllers.count; i++) {
        UIView *view = self.controllers[i].view;
        view.frame = CGRectMake(i * self.width, 0, self.width, self.height-kTitleHeight);
        [_mainScrollView addSubview:view];
    }
    
    [self addSubview:self.mainScrollView];
    
}

- (void)clickBtn:(UIButton *)sender {
    [self.mainScrollView setContentOffset:CGPointMake(sender.tag * self.width, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    NSInteger currentIndex = round(_mainScrollView.contentOffset.x / self.width);
    
    if (currentIndex != self.currentIndex) {
        self.btnArray[self.currentIndex].selected = NO;
        [UIView animateWithDuration:0.2f animations:^{
            _sliderView.frame = CGRectMake(_titleBtnWidth * currentIndex  , kTitleHeight / 2 - 17, _titleBtnWidth, 34);
            if (self.btnArray[currentIndex].frame.origin.x < self.width/2) {
                [_titleScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
            } else if (self.titleScrollView.contentSize.width - self.btnArray[currentIndex].frame.origin.x <= self.width/2) {
                [_titleScrollView setContentOffset:CGPointMake(self.controllers.count*_titleBtnWidth-self.width, 0) animated:YES];
            } else {
                [_titleScrollView setContentOffset:CGPointMake(self.btnArray[currentIndex].frame.origin.x-self.width/2+self.titleBtnWidth/2, 0) animated:YES];
            }
            
        } completion:nil];
        if ([self.eventDelegate respondsToSelector:@selector(eventWhenScrollSubViewWithIndex:)]) {
            [self.eventDelegate eventWhenScrollSubViewWithIndex:currentIndex];
        }
        self.currentIndex = currentIndex;
        self.btnArray[self.currentIndex].selected = YES;
    }
    
}


/*
  Only override drawRect: if you perform custom drawing.
  An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
  Drawing code
 }
 */

@end
