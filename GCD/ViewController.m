//
//  ViewController.m
//  GCD
//
//  Created by 阿里村菇 on 2019/5/5.
//  Copyright © 2019 阿里村菇. All rights reserved.
//

#import "ViewController.h"
#import "oneViewController.h"
#import "Test.h"
@interface Test() {
    NSString *_name;
}
@end
@interface ViewController ()



@property (nonatomic, strong)UITextView *textView;

@property (nonatomic, strong)UILabel *placeholderLabel;

@end


@implementation ViewController
-(void)viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(appWillEnterBackgroundNotification) name:@"enterBackground" object:nil];
    
}
-(void)appWillEnterBackgroundNotification{
    NSLog(@"zaihoutai");
}
-(void)viewWillDisappear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"enterBackground" object:nil];
    
}
-(void)clicks:(NSNotification*)notification{
    NSLog(@"jiainding");
    NSLog(@"---%@",notification.userInfo);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clicks:) name:@"notification" object:nil];
    NSLog(@"1");
    oneViewController * onr = [oneViewController new];
    ViewController * one = [ViewController new];
    one observeValueForKeyPath:<#(nullable NSString *)#> ofObject:<#(nullable id)#> change:<#(nullable NSDictionary<NSKeyValueChangeKey,id> *)#> context:<#(nullable void *)#>
    
    one addObserver:self forKeyPath:<#(nonnull NSString *)#> options:<#(NSKeyValueObservingOptions)#> context:<#(nullable void *)#>
    one.country = @"china";
    one.province = @"fujian";
    one.city = @"xiamen";
    one.district = @"siming";
    
    NSArray * arr =@[@"country",@"province",@"city",@"district"];
    NSArray *uppercaseString = [arr valueForKey:@"uppercaseString"];
    for (NSString * str in uppercaseString) {
        NSLog(@"%@",str);
    }
    NSDictionary * dic = [one dictionaryWithValuesForKeys:arr];
    NSLog(@"%@",dic);
    onr.dic = dic;
    [one setValuesForKeysWithDictionary:dic];
    NSLog(@"%@--%@",one.country,one.province);
    
    [self presentViewController:onr animated:YES completion:^{
        
    }];
    
}
//- (NSInteger)getAge{
//    return 20;
//}
- (NSInteger)age{
    return 10;
}
- (NSInteger)isAge{
    return 15;
}
- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"不能将%@设成nil", key);
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"出现异常，该key不存在%@", key);
}
- (void)viewDidLoad {
    
    [super viewDidLoad];
   
    Test *person = [[Test alloc]init];
    [person setValue:[NSNumber numberWithInteger:5] forKey:@"age"];
    NSLog(@"age=%@",[person valueForKey:@"age"]);
//    [self after];
    [self once];
//    UIView * views = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 400)];
//    [self.view addSubview:views];
//
//    UIColor* colorHeatMap = [UIColor colorWithRed: 0.417 green: 0.839 blue: 0.417 alpha: 1];
//    UIColor* colorWaiQuan = [UIColor colorWithRed: 0.843 green: 0.351 blue: 0.351 alpha: 1];
//
//    //外圈
//
//    UIBezierPath* waiQuanPath = [UIBezierPath bezierPath];
//
//    waiQuanPath.lineWidth = 5.0;
//    [waiQuanPath moveToPoint: CGPointMake(63.5, 49.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(100.5, 22.5) controlPoint1: CGPointMake(64.5, 47.5) controlPoint2: CGPointMake(81.5, 22.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(140.5, 52.5) controlPoint1: CGPointMake(119.5, 22.5) controlPoint2: CGPointMake(135.5, 35.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(140.5, 87.5) controlPoint1: CGPointMake(145.5, 69.5) controlPoint2: CGPointMake(140.5, 83.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(150.5, 124.5) controlPoint1: CGPointMake(140.5, 91.5) controlPoint2: CGPointMake(150.5, 100.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(135.5, 197.5) controlPoint1: CGPointMake(150.5, 148.5) controlPoint2: CGPointMake(134.5, 197.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(140.5, 242.5) controlPoint1: CGPointMake(136.5, 197.5) controlPoint2: CGPointMake(130.5, 218.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(140.5, 342.5) controlPoint1: CGPointMake(150.5, 266.5) controlPoint2: CGPointMake(173.5, 327.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(77.5, 325.5) controlPoint1: CGPointMake(107.5, 357.5) controlPoint2: CGPointMake(91.5, 361.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(56.5, 232.5) controlPoint1: CGPointMake(63.5, 289.5) controlPoint2: CGPointMake(65.5, 262.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(33.5, 155.5) controlPoint1: CGPointMake(47.5, 202.5) controlPoint2: CGPointMake(33.5, 186.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(41.5, 87.5) controlPoint1: CGPointMake(33.5, 124.5) controlPoint2: CGPointMake(26.5, 104.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(56.5, 62.5) controlPoint1: CGPointMake(56.5, 70.5) controlPoint2: CGPointMake(56.5, 62.5)];
//    [waiQuanPath addCurveToPoint: CGPointMake(63.5, 49.5) controlPoint1: CGPointMake(56.5, 62.5) controlPoint2: CGPointMake(62.5, 51.5)];
//    [waiQuanPath closePath];
//    [colorWaiQuan setFill];
//    [waiQuanPath fill];
//
//
//
//
//    //左上
//    UIBezierPath* zuoShangPath = [UIBezierPath bezierPath];
//    [zuoShangPath moveToPoint: CGPointMake(37.5, 115.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(47.5, 95.5) controlPoint1: CGPointMake(37.5, 115.5) controlPoint2: CGPointMake(38.5, 101.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(68.5, 75.5) controlPoint1: CGPointMake(56.5, 89.5) controlPoint2: CGPointMake(63.5, 79.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(93.5, 69.5) controlPoint1: CGPointMake(73.5, 71.5) controlPoint2: CGPointMake(87.5, 66.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(101.5, 86.5) controlPoint1: CGPointMake(99.5, 72.5) controlPoint2: CGPointMake(105.5, 80.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(79.5, 102.5) controlPoint1: CGPointMake(97.5, 92.5) controlPoint2: CGPointMake(84.5, 97.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(66.5, 106.5) controlPoint1: CGPointMake(74.5, 107.5) controlPoint2: CGPointMake(69.5, 101.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(43.5, 120.5) controlPoint1: CGPointMake(63.5, 111.5) controlPoint2: CGPointMake(49.5, 122.5)];
//    [zuoShangPath addCurveToPoint: CGPointMake(37.5, 115.5) controlPoint1: CGPointMake(37.5, 118.5) controlPoint2: CGPointMake(37.5, 115.5)];
//    [zuoShangPath closePath];
//    [colorHeatMap setFill];
//    [zuoShangPath fill];
//
////    CAShapeLayer * layer1 = [CAShapeLayer layer];
////    layer1.path = zuoShangPath.CGPath;
////    [self.view.layer addSublayer:layer1];
//    //右上
//    UIBezierPath* youShangPath = [UIBezierPath bezierPath];
//    [youShangPath moveToPoint: CGPointMake(103.5, 73.5)];
//    [youShangPath addCurveToPoint: CGPointMake(109.5, 53.5) controlPoint1: CGPointMake(103.5, 73.5) controlPoint2: CGPointMake(105.5, 59.5)];
//    [youShangPath addCurveToPoint: CGPointMake(128.5, 59.5) controlPoint1: CGPointMake(113.5, 47.5) controlPoint2: CGPointMake(123.5, 49.5)];
//    [youShangPath addCurveToPoint: CGPointMake(124.5, 88.5) controlPoint1: CGPointMake(133.5, 69.5) controlPoint2: CGPointMake(130.5, 84.5)];
//    [youShangPath addCurveToPoint: CGPointMake(103.5, 78.5) controlPoint1: CGPointMake(118.5, 92.5) controlPoint2: CGPointMake(103.5, 87.5)];
//    [youShangPath addCurveToPoint: CGPointMake(103.5, 73.5) controlPoint1: CGPointMake(103.5, 69.5) controlPoint2: CGPointMake(103.5, 73.5)];
//    [youShangPath closePath];
//    [colorHeatMap setFill];
//    [youShangPath fill];
//
//
//    //中间
//    UIBezierPath* zhongJianPath = [UIBezierPath bezierPath];
//    [zhongJianPath moveToPoint: CGPointMake(44.57, 146.41)];
//    [zhongJianPath addCurveToPoint: CGPointMake(57.5, 125.5) controlPoint1: CGPointMake(44.82, 139.44) controlPoint2: CGPointMake(46.81, 129.9)];
//    [zhongJianPath addCurveToPoint: CGPointMake(129.5, 111.5) controlPoint1: CGPointMake(74.5, 118.5) controlPoint2: CGPointMake(117.5, 97.5)];
//    [zhongJianPath addCurveToPoint: CGPointMake(120.5, 154.5) controlPoint1: CGPointMake(141.5, 125.5) controlPoint2: CGPointMake(136.5, 141.5)];
//    [zhongJianPath addCurveToPoint: CGPointMake(101.5, 195.5) controlPoint1: CGPointMake(104.5, 167.5) controlPoint2: CGPointMake(101.5, 185.5)];
//    [zhongJianPath addCurveToPoint: CGPointMake(84.5, 230.5) controlPoint1: CGPointMake(101.5, 205.5) controlPoint2: CGPointMake(96.5, 230.5)];
//    [zhongJianPath addCurveToPoint: CGPointMake(50.5, 177.5) controlPoint1: CGPointMake(72.5, 230.5) controlPoint2: CGPointMake(50.5, 177.5)];
//    [zhongJianPath addCurveToPoint: CGPointMake(44.57, 146.41) controlPoint1: CGPointMake(50.5, 177.5) controlPoint2: CGPointMake(44.42, 150.53)];
//    [zhongJianPath closePath];
//    [colorHeatMap setFill];
//    [zhongJianPath fill];
//
//
//    //下面
//    UIBezierPath* xiaMianPath = [UIBezierPath bezierPath];
//    [xiaMianPath moveToPoint: CGPointMake(101.71, 259.98)];
//    [xiaMianPath addCurveToPoint: CGPointMake(125.5, 286.5) controlPoint1: CGPointMake(110.62, 260.11) controlPoint2: CGPointMake(122.09, 264.92)];
//    [xiaMianPath addCurveToPoint: CGPointMake(112.5, 332.5) controlPoint1: CGPointMake(131.5, 324.5) controlPoint2: CGPointMake(123.5, 327.5)];
//    [xiaMianPath addCurveToPoint: CGPointMake(79.5, 301.5) controlPoint1: CGPointMake(101.5, 337.5) controlPoint2: CGPointMake(82.5, 316.5)];
//    [xiaMianPath addCurveToPoint: CGPointMake(84.5, 268.5) controlPoint1: CGPointMake(76.5, 286.5) controlPoint2: CGPointMake(79.5, 274.5)];
//    [xiaMianPath addCurveToPoint: CGPointMake(101.71, 259.98) controlPoint1: CGPointMake(89.5, 262.5) controlPoint2: CGPointMake(94.93, 259.89)];
//    [xiaMianPath closePath];
//    [colorHeatMap setFill];
//    [xiaMianPath fill];
//
//    CAShapeLayer * layer = [CAShapeLayer layer];
//    layer.path = waiQuanPath.CGPath;
//    layer.fillColor = colorWaiQuan.CGColor;
//    [self.view.layer addSublayer:layer];
//
//    CAShapeLayer * layer1 = [CAShapeLayer layer];
//    layer1.path = zuoShangPath.CGPath;
//    layer1.fillColor = colorHeatMap.CGColor;
//    [self.view.layer addSublayer:layer1];
//
//    CAShapeLayer * layer2 = [CAShapeLayer layer];
//    layer2.path = youShangPath.CGPath;
//    layer2.fillColor = colorHeatMap.CGColor;
//    [self.view.layer addSublayer:layer2];
//
//    CAShapeLayer * layer3 = [CAShapeLayer layer];
//    layer3.path = xiaMianPath.CGPath;
//    layer3.fillColor = colorHeatMap.CGColor;
//    [self.view.layer addSublayer:layer3];
//    //y同步队列
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.alicungu.www", DISPATCH_QUEUE_SERIAL);
//    //异步队列
//    dispatch_queue_t concurrentQueue = dispatch_queue_create("con.alicungu.www", DISPATCH_QUEUE_CONCURRENT);
//    //串行队列特殊队列：主队列
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    //并发队列 默认全局并发队列
//    dispatch_queue_t globelQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//    //同步执行任务创建方法
//    dispatch_sync(serialQueue, ^{
//
//    });
//    //异步执行任务创建方法
//    dispatch_async(concurrentQueue, ^{
//
//    });
    
//    [self sync_Concurrent];
    
//    [self async_Concurrent];
    
//    [self sync_Serial];
    
//    [self async_Serial];
    
//    [self syncMain];
    
//    [self asyncMain];
    
//    [self communication];

//    _textView = [[UITextView alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
//
//    // 1、取消首字母自动大些。
//    _textView.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    // 2、取消自动跟修正输入
//    _textView.autocorrectionType = UITextAutocorrectionTypeNo;
//    // 3、这里是第3个坑
//    _textView.font = [UIFont systemFontOfSize:14];
//    _textView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_textView];
////    [_textView makeConstraints:^(MASConstraintMaker *make) {
////        make.center.equalTo(self.view);
////        make.size.equalTo(CGSizeMake(200, 200));
////    }];
//
//    _placeholderLabel = [UILabel new];
//    _placeholderLabel.numberOfLines = 0;
//    // 3、textView和placeholderLabel的字体必须一样！！！否则placeholderLabel会超出textView界限。
//    _placeholderLabel.font = [UIFont systemFontOfSize:14];
//    _placeholderLabel.textColor = [UIColor lightGrayColor];
//    [_placeholderLabel sizeToFit];
//    // 4、placeholderLabel必须加在textView上，否则涂层中根本不会有
//    [_textView addSubview:_placeholderLabel];
//    _placeholderLabel.text = @"不就是比较好的办法就是不会见风使舵";
//    @try {
//        [_textView setValue:_placeholderLabel forKey:@"_placeholderLabel"];
//    } @catch (NSException *exception) {} @finally {}
//
//    UITextField * tf = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
//    tf.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:tf];
//    tf.placeholder = @"nihao";
//    [tf setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
//    
//    [tf setValue:[UIColor yellowColor] forKeyPath:@"_placeholderLabel.backgroundColor"];
    
//    UILabel *label = [self valueForKeyPath:@"_placeholderLabel"];
//    label.textColor = [UIColor orangeColor];
//    label.text = @"11222";
//    [tf addSubview:label];
//    UITextFieldLabel * tl = [UITextFieldLabel new];
}
//同步并列
- (void)sync_Concurrent{
    NSLog(@"sync_Concurrent----begin");
    dispatch_queue_t queue = dispatch_queue_create("com.alicun.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);//打印当前线程
        }
    });
    NSLog(@"syncConcurrent---1end");
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2-----%@",[NSThread currentThread]);
        }
    });
        NSLog(@"syncConcurrent---2end");
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3-----%@",[NSThread currentThread]);
        }
    });
        NSLog(@"syncConcurrent---end");
}

//异步并列
- (void)async_Concurrent{
     NSLog(@"async_Concurrent----begin");
    dispatch_queue_t queue =dispatch_queue_create("com.alicun.www", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    });
//    NSLog(@"1-----%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    });
//    NSLog(@"2-----%@",[NSThread currentThread]);
    dispatch_async(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3----%@",[NSThread currentThread]);
        }
    });
     NSLog(@"asyncConcurrent---end");
//    NSLog(@"3-----%@",[NSThread currentThread]);
}
//同步串行队列
- (void)sync_Serial{
    NSLog(@"syncSerial----begin");
    dispatch_queue_t queue = dispatch_queue_create("com.alicungu.www", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3----%@",[NSThread currentThread]);
        }
    });
    NSLog(@"syncSerial---end");
    
}
//异步串行队列
- (void)async_Serial{
    NSLog(@"asyncSerial----begin");
    dispatch_queue_t queue = dispatch_queue_create("com.alicun.www", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3----%@",[NSThread currentThread]);
        }
    });
    NSLog(@"asyncSerial---end");
}

- (void)syncMain{
    NSLog(@"asyncSerial---begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3----%@",[NSThread currentThread]);
        }
    });
    NSLog(@"syncMain---end");
    
}
- (void)asyncMain{
    NSLog(@"asyncSerial---begin");
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3----%@",[NSThread currentThread]);
        }
    });
    NSLog(@"asyncMain---end");
}

- (void)communication{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"1----%@",[NSThread currentThread]);
        }
        
        dispatch_async(mainQueue, ^{
            //        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"2----%@",[NSThread currentThread]);
            //        }
        });
        
    });
   
    dispatch_async(queue, ^{
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];
            NSLog(@"3----%@",[NSThread currentThread]);
        }

        
    });
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 2; i++) {
//            [NSThread sleepForTimeInterval:2];
//            NSLog(@"3----%@",[NSThread currentThread]);
//        }
//    });
}
//GCD延迟执行
- (void)after{
    NSLog(@"begin");
    dispatch_queue_t queue = dispatch_queue_create("com.alicun.www", DISPATCH_QUEUE_SERIAL);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0*NSEC_PER_SEC)), queue, ^{
        NSLog(@"回到主线程");
        NSLog(@"%@",[NSThread currentThread]);
    });
}
//一次性代码
- (void)once{
    dispatch_once_t onceToken;
    for (int i = 0; i<3; i++) {
        dispatch_once(&onceToken, ^{
            NSLog(@"一次性%d",i);
        });
        NSLog(@"%d",i);
    }

}
- (void)groupNotipy{
    NSLog(@"currentThread--%@",[NSThread currentThread]);
    NSLog(@"begin");
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
    });
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self removeObserver:<#(nonnull NSObject *)#> forKeyPath:<#(nonnull NSString *)#>
}
@end

