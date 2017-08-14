//
//  OriginalViewController.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/11.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "OriginalViewController.h"
#import "OriginalVideoController.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"
#define url @"http://yangruixin.com/test/apiForText.php"
@interface OriginalViewController ()
@property(strong, nonatomic) NSMutableArray *dataArray;
@property(strong, nonatomic) NSArray *videoUrl;
@property(strong, nonatomic) UIScrollView *scroll;
@end

@implementation OriginalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0 green:240/255.0 blue:242/255.0 alpha:1];
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 8, ScreenWidth, SCREENHEIGHT - 50)];
    _scroll.contentSize = CGSizeMake(SCREENWIDTH, SCREENHEIGHT + 150);
    _scroll.backgroundColor = [UIColor whiteColor];
//    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.showsVerticalScrollIndicator = YES;
    _scroll.alwaysBounceVertical = YES;

    [_scroll flashScrollIndicators];
        [self.view addSubview:_scroll];
    _videoUrl = @[@"http://v.youku.com/v_show/id_XNzExODM3Njk2.html?from=y1.2-1-95.3.12-2.1-1-1-11-0", @"http://v.youku.com/v_show/id_XMTI2NjE0MDcwNA==.html?from=s1.8-1-1.2", @"http://v.youku.com/v_show/id_XMTc1OTA2MzUzMg==.html?spm=a2h0k.8191407.0.0&from=s1.8-1-1.2",@"http://v.youku.com/v_show/id_XNzA0MDc2ODA0.html?from=s1.8-1-1.1", @"http://v.youku.com/v_show/id_XNDAzNzQ1MjA4.html?from=s1.8-1-1.1",@"http://v.youku.com/v_show/id_XNDMyNTIzMzAw.html?from=s1.8-1-1.1",@"http://v.youku.com/v_show/id_XNzIxODU1OTYw.html?from=s1.8-1-1.1",@"http://v.youku.com/v_show/id_XMTcxOTM2MTc4MA==.html?spm=a2h0j.8191423.module_basic_relation.5~5!2~5~5!7~5~5~A"];
    [self download];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setImage{
    
    for (int i = 0; i < _dataArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        NSString* encodedString = [_dataArray[i][@"cover"] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLFragmentAllowedCharacterSet]];
        UIImageView *vise = [[UIImageView alloc] initWithFrame:CGRectMake(i % 2 * ScreenWidth / 2  + 20, 64 + i / 2 * ScreenWidth / 2 - 50, ScreenWidth / 2 - 30, ScreenWidth / 2 - 50)];
        [vise sd_setImageWithURL:[NSURL URLWithString:encodedString]];
        vise.layer.cornerRadius = 8;
        vise.clipsToBounds = YES;
        [_scroll addSubview:vise];
        [btn addTarget:self action:@selector(tap:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = i;
        btn.frame = CGRectMake(i % 2 * ScreenWidth / 2  + 25, 64 + i / 2 * ScreenWidth / 2 - 50, ScreenWidth / 2 - 50, ScreenWidth / 2 - 50);
        [_scroll addSubview:btn];
        
        UILabel *names = [[UILabel alloc]initWithFrame:CGRectMake(vise.centerX - 100, vise.centerY + ScreenWidth / 4 - 25, 200, 30)];
        names.textAlignment = NSTextAlignmentCenter;
        names.text = _dataArray[i][@"name"];
        [_scroll addSubview:names];
    }

}

-(void)download{
    NSDictionary *params = @{@"RequestType": @"natureCQUPT"};
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    NSMutableSet *acceptableSet = [NSMutableSet setWithSet:manager.responseSerializer.acceptableContentTypes];
    [acceptableSet addObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = acceptableSet;
    [manager GET:url parameters:params success:^(AFHTTPRequestOperation *operation, id  responseObject) {
        NSDictionary *dic = responseObject;
        _dataArray = [dic objectForKey:@"Data"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self setImage];
        });
    }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"失败了");
    }];

}
-(void)tap:(UIButton *)btn{
    OriginalVideoController *video = [[OriginalVideoController alloc]init];
    video.videoUrlStr =  _videoUrl[btn.tag];
    [self.parentViewController.navigationController presentViewController:video animated:YES completion:nil];
}


@end
