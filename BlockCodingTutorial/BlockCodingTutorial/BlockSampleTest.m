//
//  BlockSampleTest.m
//  BlockCodingTutorial
//
//  Created by wenote on 2017. 2. 13..
//  Copyright © 2017년 potenn. All rights reserved.
//

#import "BlockSampleTest.h"

@implementation BlockSampleTest

- (id)init{
    
    self = [super init];
    if(self){
        
        //Your Code
        
    }
    
    return self;
}


/**
 Delegate style is mostly used when it has to be processed mainly by asynchronous method, but nowadays, when it receives only one result, it uses this block method a lot.
 */

- (void)configureBlock{
    
    //Ex1
    int multiplier = 7;
    
    //myBlock is function Block Variable.
    // ^(int num) is Function Of Block Type.
    int (^myBlock)(int) = ^(int num){
        return num * multiplier;
    };
    
    int result = myBlock(10);
    NSLog(@"Result : %d",result);
    
    //Ex2
    [self startRequestWithCompletion:^(int a, int b){
       
        //Process Data
        NSLog(@"Completion");
        NSLog(@"A+B %d",a+b);
    }];
    
    //Ex 3
    [self testTypedefBlock:^(int a){
        
        NSLog(@"a * a = %d",a*a);
        return a * a;
        
    }];
    
    
    //Ex 4
    [self calcTime:^{
        
        //Completed
        NSLog(@"Finishes the hard Process");
        
    }];
    
    // prevent retain Cycel Code
    [self preventBlockRetainCycle];
    
}


- (void)calcTime:(handler)handler{
    
    //Hard Process
    NSLog(@"Hard Process start");
    
    //When the hard process finishes, below the code execute
    handler();
    
}

- (void)testTypedefBlock:(test)testBlock{
    
    NSLog(@"Process testTypeDefBlock");
    int b = testBlock(5);

    NSLog(@"B : %d",b);
}

- (void)startRequestWithCompletion:(ResponseBlock)responseBlock{
    
    NSLog(@"Start Request");
    responseBlock(5,10);

}

- (void)preventBlockRetainCycle{

    /**
    This happens retain Cycle.
     *.
    
    _model = [[SampleModel alloc] init];
    _model.myBlock = ^{
        [self print];
    };
    
    _model.myBlock();
     */
    
    __weak BlockSampleTest *bSampleTest = self;
    
    _model = [[SampleModel alloc] init];
    _model.myBlock = ^{
      
        __strong BlockSampleTest *strongBSampleTest = bSampleTest;
        if(strongBSampleTest){
            [strongBSampleTest print];
        }
        
    };
    _model.myBlock();
    
}

-(void)print{
    NSLog(@"preventBlockRetainCycel Test");
}

@end
