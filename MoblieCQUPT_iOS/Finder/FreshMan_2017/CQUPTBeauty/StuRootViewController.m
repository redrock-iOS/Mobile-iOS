//
//  StuRootViewController.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/7.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "StuRootViewController.h"
#import "OriginalCY.h"
#import "SegmentView.h"
#import "CQUPTStudentsViewController.h"
#import "CQUPTBeautyViewController.h"
@interface StuRootViewController ()

@end

@implementation StuRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    OriginalCY * vc1 = [[OriginalCY alloc]init];
    vc1.title = @"原创重邮";
    CQUPTStudentsViewController *vc2 = [[CQUPTStudentsViewController alloc] init];
    vc2.title = @"优秀学生";
    CQUPTBeautyViewController *vc3 = [[CQUPTBeautyViewController alloc] init];
    vc3.title = @"美在重邮";
    NSArray *vcArray = @[vc1,vc2,vc3];
    SegmentView *segmentView = [[SegmentView alloc] initWithFrame:CGRectMake(0, self.navigationController.navigationBar.frame.size.height + 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.bounds.size.height - 20) andControllers:vcArray];
    NSArray *name = @[@"丛广林",@"刘志宗",@"冯益青", @"刘慧鹏", @"郭鑫", @"马晨歌", @"田彬人", @"20-810宿舍", @"04991401班", @"热则耶·吐尔洪", @"姜玉琦", @"谭威", @"王金鸡", @"刘国栋", @"刘锐",@"王秋毅", @"刘志凡", @"王婷", @"0491201班"];
    NSArray *context = @[@"e路有你，书写无悔青春",@"逐梦，为更好的自己",@"全面发展行路远，心底无私天地宽", @"科研创新炼真金，风浪搏击显本色", @"创新是为了产生实际价值", @"悠悠歌声伴我心,信息科创任我行", @"青春正当时，不予负流年", @"以梦为马，努力趁年华", @"让优秀成为一种习惯", @"单丝不成线，独木不成林!", @"Attitude is everything.", @"天行健，君子以自强不息；地势坤.", @"心有多大，舞台就有多大。", @"天道酬勤。", @"精感石没羽，岂云惮险艰。",@"大爱无疆，小爱润物。", @"无穷的远方，无尽的人们，都与我有关。", @"坚持就是胜利！", @"团结奋进、拼搏创新、计科卓一、永争第一"];
    NSArray *detail = @[@"重邮小帮手背后的技术好能手，用创意传递团思党意；红岩网校里辛勤的代码探索者，用产品激活青春正能量。用原创游戏贴近同学，建专题网站打造主流，带技能培训熔炼团队，抓宣传跟帖清朗网络。他就是将实践服务融入网络的社会主义核心价值观传播者。",@"艰辛坎坷的生活中，他勇于担当，挑起家庭重担，用奖助学金及兼职收入补贴家用；追逐梦想的道路上，他自信自强，以优异的成绩保送重大。怀瑾握瑜，精心照顾三位重症家人；被褐怀珠，用坚韧的信念改写人生。以坚强、责任与孝道感染众人，他是重邮学子的道德楷模。",@"两次国家奖学金、学业绩点3.8、必修课平均分91.1分是她三年学业的骄人成绩；美国数模竞赛特等奖（最高奖）、全国英语竞赛特等奖等6项省部级以上奖项，是她课外竞赛的累累硕果；50余小时的“云互助”朋辈辅导授课，共同进步的寝室氛围营造，是她乐于奉献的真实写照。她是一个求真知、重实践、讲奉献，努力筑梦青春的全能学子。", @"他心中有一片海，虽布满漩涡与礁石，但前行时目光笃定。知识是船身，夯实科创基础；思想是罗盘，指引前行方向；坚持是桅杆，支撑奋斗风帆。电设、数模、机器人大赛等国家级奖项4项，公开发表论文3篇，都是他航程中登上的一座座新大陆。奋力吹响科技创新的集结号，他就是科创界的弄潮儿。", @"他是创趣异站创始人，重庆森蓝戈科技有限公司总经理，VIPC创业团队组建者。创业路上他一度艰难前行，蹲马路，参路演，拉投资，无所畏惧。创业艰辛也不忘反哺母校，带领百余学弟学妹踏上“双创”征程。他的先进事迹荣登《光明日报》，他就是以创新创造价值的重邮创客。", @"他以梦为马，从阳光校广走向全国舞台，用声音抒发满腔热忱；他如沐晨曦，从重邮校园跳向全能国标，以舞步谱写艺术篇章；他人生当歌，从青春梦想迈向腾讯事业，将旋律唱进明媚未来。主持、舞蹈、歌唱，他是因执着而让梦想熠熠闪光的文艺工科男。", @"她笔走一方纸卷，学业绩点3.8，专业排名第一，荣获国家奖学金和特等奖学金；她推演数理逻辑，数学建模屡创佳绩，校园的路灯见证了她的勤奋和坚守。大学三年，20余项荣誉，5项国家级、省部级奖项完美诠释了天道酬勤的真谛，她用最朴实的方式践行当代大学生以学为先的天职，她是重邮优良学风的践行者。", @"青春闲不住，百舸争流勤者胜；梦想在奋斗，铿锵玫瑰共进退。参加数模竞赛、申请发明专利、发表核心论文、投身志愿服务，她们用2项专利、4张录取通知书、7个100%、28项技能认证、54次荣誉奖项证明了：努力的女孩最美丽！ 她们就是携手前行的重邮四姐妹。", @"平均绩点3.0，人均科技竞赛获奖2.2次，他们是修德、博学精神的追寻者；担任社会工作114人次，志愿服务总时长1800小时，他们是求实、创新誓言的践行者。集体奖16项、个人奖223项，他们携手在三年时光里，用青春和汗水镌刻出一面 “聚似一团火，散作满天星”的集体荣誉墙。", @"热则耶·吐尔洪，女，维吾尔族，中共党员，经济管理学院2012级经济学专业学生，担任学生五支部副书记、班级学习委员、寝室长。", @"姜玉琦，女，共青团员，经济管理学院2013级会计学专业学生，担任朋辈学长、学习委员。", @"谭威，男，自动化学院2014级自动化专业卓越工程师班学生。", @"王金鸡，女，共青团员，传媒艺术学院2013级广播电视编导专业学生。任重庆邮电大学校史展览馆志愿者解说队队长。", @"刘国栋，男，共青团员员，自动化学院2014级控制工程专业学生, 在非线性动力学与控制创新团队中从事仿人机器人相关研究，任实验室机器人方向负责人。", @"刘锐，男，共青团员，通信与信息工程学院2013级信息工程专业学生,现任“重邮e站”微+平台主编。",@"王秋毅，男，共产党员，自动化学院2012级物联网工程专业学生。", @"刘志凡，男，共青团员，经济管理学院2012级工程管理专业学生，重庆标码旅行社有限责任公司创始人，重庆市创业家协会常委，目前该生已保送东北财经大学攻读硕士研究生。获全国性杂志《大学生》两页专题报道《刘志凡，露营我们做的深》，重庆电视台招考直通车栏目组专题报道，重庆商报整版报道《深耕高校旅游市场，大学生三月赚五万》。", @"王婷，女，共青团员，生物信息学院2013级制药工程专业学生,现任校女子排球队队长、班级生活委员。", @"0491201班,计算机科学与技术学院2012级计算机科学与技术专业卓越工程师班,共35人,其中中共党员11人,中共预备党员8人。"];
    
    [vc2 getTheStudentsName:name AndContext:context];
    vc2.contextArray = detail;
    [self.view addSubview:segmentView];

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
