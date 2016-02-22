//
//  ViewController.m
//  07-粒子动画
//
//  Created by Doris on 16/2/22.
//  Copyright © 2016年 Doris. All rights reserved.
//

#import "ViewController.h"

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]

#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()
{
    CAEmitterLayer * _streamerEmitter;//发射器对象
}
@property (nonatomic,strong) UIView *myView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*0.5, self.view.frame.size.width, self.view.frame.size.height*0.8)];
    [self.view addSubview:myView];
    self.myView = myView;
    self.myView.backgroundColor = [UIColor colorWithRed:0.6 green:0 blue:0.2 alpha:0.2];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self startAnimation];
}

- (void)startAnimation
{
    //设置发射器
    _streamerEmitter=[[CAEmitterLayer alloc]init];
    _streamerEmitter.emitterPosition=CGPointMake(self.view.frame.size.width/2,self.view.frame.size.height/2);
    _streamerEmitter.emitterSize=CGSizeMake(self.view.frame.size.width-100, 20);
    _streamerEmitter.renderMode = kCAEmitterLayerAdditive;
    _streamerEmitter.preservesDepth = YES;
    
    //发射单元
    //彩带
    CAEmitterCell * smoke = [CAEmitterCell emitterCell];
    smoke.birthRate=100;
    smoke.lifetime=3.0;
    smoke.lifetimeRange=1;
    smoke.scale = 0.5;
    smoke.scaleRange = 0.5;
    smoke.color=[UIColor colorWithRed:0 green:1 blue:0 alpha:0.2].CGColor;
    smoke.alphaRange = 1;
    smoke.redRange =255;
    smoke.blueRange = 22;
    smoke.greenRange = 1.5;
    smoke.contents=(id)[[UIImage imageNamed:@"彩花.png"]CGImage];
    [smoke setName:@"smoke"];
    
    smoke.velocity=200;
    smoke.velocityRange=50;
    smoke.emissionLongitude=M_PI+M_PI_2;
    smoke.emissionRange=M_PI_2;
    smoke.spin = M_PI_2;
    smoke.spinRange = M_PI_2;
    
    _streamerEmitter.emitterCells=[NSArray arrayWithObjects:smoke,nil];
    [self.myView.layer addSublayer:_streamerEmitter];
}

@end
