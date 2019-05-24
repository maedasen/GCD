//
//  oneViewController.m
//  GCD
//
//  Created by 阿里村菇 on 2019/5/10.
//  Copyright © 2019 阿里村菇. All rights reserved.
//

#import "oneViewController.h"
#import "ViewController.h"
@interface oneViewController ()

@end

@implementation oneViewController
-(void)viewDidDisappear:(BOOL)animated{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(viewDidAppear:)
                                                 name:UIApplicationWillResignActiveNotification object:nil];//进入后台
}
-(void)setage:(NSInteger)age{
    
}
- (void)viewDidLoad {
    //监听后台
   
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didNotification) name:UIApplicationDidBecomeActiveNotification object:nil];//退出后台
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    ViewController * vc = [ViewController new];
    [vc setValuesForKeysWithDictionary:self.dic];
    NSLog(@"%@--%@",vc.country,vc.province);

    NSArray *values=@[@"One",@"Two",@"Three"];
    NSArray *keys=@[@"A",@"B",@"C"];
    NSDictionary *dict =[NSDictionary dictionaryWithObjects:keys forKeys:values];
    //发送通知
    NSLog(@"%@",dict);
    [[NSNotificationCenter defaultCenter]postNotification:[NSNotification notificationWithName:@"notification" object:nil userInfo:dict]];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification" object:nil userInfo:dict];
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(void)btnClickAction:(id)sender{
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)didNotification{
    NSLog(@"推到后台");
}
-(void)viewDidAppear{
    NSLog(@"jindaohoutai");
}
@end
