//
//  Task.h
//  BlockIntroduce
//
//  Created by dean on 2016/11/1.
//  Copyright © 2016年 dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property double odometer;

-(void)beginTaskWithCallBack:(void (^)(void))callBackBlock;

-(int)caculateAfterBlock:(int (^)(int ppp))numberCallBack andInSideNumber:(int)ddd;

- (void)driveForDuration:(double)duration
       withVariableSpeed:(double (^)(double time))speedFunction
                   steps:(int)numSteps;


-(void)addNumber:(int)number1 withNumber:(int)number2 andCompletionHandler:(void (^)(int result))completionHandler;
@end
