//
//  Task.m
//  BlockIntroduce
//
//  Created by dean on 2016/11/1.
//  Copyright © 2016年 dean. All rights reserved.
//

#import "Task.h"



@implementation Task
//交由這個物件來跑網路，當跑完之後，他就處理完之後，在把物件丟回去給controller
-(void)beginTaskWithCallBack:(void (^)(void))callBackBlock
{
    NSLog(@"in the callBack Function");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        callBackBlock();
        
    });
    
}

-(int)caculateAfterBlock:(int (^)(int ppp))numberCallBack andInSideNumber:(int)ddd
{
    int k = 1 ;
    
    int lll = numberCallBack(ddd +9);
    
    return k + lll;
    
}
- (void)driveForDuration:(double)duration
       withVariableSpeed:(double (^)(double time))speedFunction
                   steps:(int)numSteps {
    double dt = duration / numSteps;
    for (int i=1; i<=numSteps; i++) {
        _odometer += speedFunction(i*dt) * dt;
    }
}


-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler{
    int result = number1 + number2;
    completionHandler(result);//拿到需要的參數，組合以後，用block吐出去給他，也就是callback，這邊做完以後，吐出去
}

@end
