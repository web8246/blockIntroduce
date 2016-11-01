//
//  ViewController.m
//  BlockIntroduce
//
//  Created by dean on 2016/11/1.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "ViewController.h"
#import "Task.h"

@interface ViewController ()

//也可以讓他成為屬性：

@property (nonatomic ,strong) int (^propertyBlockOne)(int);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self isBlock];
    [self exchangeValueOutsideBlock];
    [self blcokCallBack];
    //屬性block設置主體（裡面要做的事情）
    self.propertyBlockOne = ^(int i)
    {
        
        return i+3;
    };
    //call blockProperty
    NSLog(@"hihi: %d",self.propertyBlockOne(7));
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)isBlock
{
    //這就是一個block
    ^(int num) {
        
        return num;
    };
    //把block給一個物件
    int (^firstBlock)(int) = ^(int num)
    {
        
        return num+2;
    };
    
    //調用他：
    NSLog(@"i: %d",firstBlock(3));
    
}

-(void)exchangeValueOutsideBlock
{
    __block int kkk = 20;
    
    int (^secondBlock)(int) = ^(int j)
    {
        kkk = kkk+j;
        
        return j;
    };
    
    int lll = secondBlock(3);
    NSLog(@"lll: %d",lll);
    NSLog(@"kkk: %d",kkk);
    
}

-(void)blcokCallBack
{
    Task *task = [Task new];
    [task beginTaskWithCallBack:^{
        NSLog(@"hahaha");//這邊就是需要Task的物件方法，裡面去跑的block
    }];
    
    int p = [task caculateAfterBlock:^int(int ppp) {
        ppp = 3;
        return 5;
    } andInSideNumber:2];
    
    NSLog(@"pppp: %d",p);
    
    [task driveForDuration:10.0
           withVariableSpeed:^(double time) {
               return time + 5.0;
           } steps:100];
    NSLog(@"The car has now driven %.2f meters", task.odometer);
    
    [task addNumber:3 withNumber:5 andCompletionHandler:^(int result) {
        NSLog(@"The result is %d", result);//等做完以後，這邊就callback吐出來給我
    }];
}


@end
