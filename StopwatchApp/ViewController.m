//
//  ViewController.m
//  StopwatchApp
//
//  Created by 池田享浩 on 2015/12/07.
//  Copyright (c) 2015年 takahiro ikeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *imageView;
    UILabel *label;
    UIButton *ssbutton;
    NSInteger count;
    NSInteger countNumber,minuteNumber;
    NSTimer *timer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    count = 0;
    countNumber = 0;
    minuteNumber = 0;
    [self setupParts];
}

-(void)setupParts{
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)];
    imageView.image = [UIImage imageNamed:@"stpwtchiph5.png"];
    [self.view addSubview:imageView];
    
    ssbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    ssbutton.frame =  CGRectMake(0,0,100,50);
    ssbutton.center = CGPointMake(160,300);
    [ssbutton setTitle:@"スタート" forState:UIControlStateNormal];
    [ssbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [ssbutton addTarget:self action:@selector(startstop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ssbutton];
    
    UIButton *resetbutton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resetbutton.frame =  CGRectMake(0,0,100,50);
    resetbutton.center = CGPointMake(160,370);
    //resetbutton.backgroundColor = [UIColor whiteColor];
    [resetbutton setTitle:@"リセット" forState:UIControlStateNormal];
    [resetbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [resetbutton addTarget:self action:@selector(reset:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resetbutton];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0,0,160,50)];
    label.center = CGPointMake(160,210);
    label.font = [UIFont fontWithName:@"HirakakuProN-W6" size:48];
    label.text = @"00:00";
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];

    

}

-(void)reset:(id)sender{
    if(count == 0){
    label.text = @"00:00";
    countNumber = 0;
    minuteNumber = 0;
    NSLog(@"リセット動作確認　countNumber = %ld", (long)countNumber);
    NSLog(@"リセット動作確認　minuteNumber = %ld", (long)countNumber);
    }
}

-(void)startstop:(id)sender{
    count++;
    NSInteger a;
    a = count;
    if(count == 1){
            [ssbutton setTitle:@"ストップ" forState:UIControlStateNormal];
            [ssbutton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            timer = [NSTimer scheduledTimerWithTimeInterval:1.0  target:self selector:@selector(tick:) userInfo:nil repeats:YES];//読み込んだら動作をかいしするもの
        } else {
            [self stop];
            [ssbutton setTitle:@"スタート" forState:UIControlStateNormal];
            [ssbutton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
            count = 0;
            NSLog(@"ストップ動作確認　countNumber = %ld", (long)countNumber);

        }
}

-(void)tick:(NSTimer*)timer{
    countNumber++;
    NSLog(@"動作確認countNumber = %ld",(long)countNumber);
    if(countNumber == 60){
        countNumber = 0;
        minuteNumber ++;
        if(minuteNumber == 60){
            minuteNumber = 0;
        }
    NSLog(@"動作確認countNumber = %ld",(long)countNumber);
    NSLog(@"動作確認countNumber = %ld",(long)minuteNumber);
    }
    
    NSString *minute;
    NSString *second;
    NSString *stopwatch;
    minute = [NSString stringWithFormat: @"%02ld:",(long)minuteNumber];
    second = [NSString stringWithFormat: @"%02ld",(long)countNumber];
    stopwatch =[minute stringByAppendingString:second];
    label.text = stopwatch;
    
}

-(void)stop{
    if(timer != nil){
        [timer invalidate];
        timer = nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
