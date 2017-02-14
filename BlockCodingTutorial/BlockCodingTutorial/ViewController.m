//
//  ViewController.m
//  BlockCodingTutorial
//
//  Created by wenote on 2017. 1. 26..
//  Copyright © 2017년 potenn. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     1. Block can give callback code when something is called.(호출시점에서 콜백
     2. In lexical range, block can access local method(function).
     3. instead of delegateMethods not spread to many files
     4. blocks are also useful when you implement multithreading applications
     */
    
    _blockAsMemberVar = ^(void){
        return @"This block is ViewController's member variable";
    };
    
    
    int (^howMany)(int,int) = ^(int a, int b){
        return a + b;
    };
    
    NSLog(@"%d",howMany(5, 10));
    
    /*
     Return Type ^blockName Parameters
     */
    
    NSDate *(^today)(void);
    today = ^(void){
        return [NSDate date];
    };
    
    NSLog(@"%@",today());
    
    float results = ^(float value1, float value2, float value3){
        return value1 * value2 * value3;
    }(1.2,3.4,5.6);
    
    NSLog(@"%f",results);
    
    
    int factor = 5;
    int (^newResult)(void) = ^(void){
        return factor * 10;
    };
    
    NSLog(@"%d",newResult());
    
    //Block Type
    [self testBlockStorageType];
    
    
    //Block As Completion Handlers
    [self addNumber:5 WithNumber:7 andCompletionHandler:^(int result){
        
        // Completion Code
        NSLog(@"The add result is %d",result);
        
    }];
    
    [self minusNumber:5 WithNumber:7 andCompletionHandler:^(int result){
        
        // Completion Code
        NSLog(@"The Minus result is %d",result);
    }];
    
    
    NSLog(@"BlockSampleTest");
    BlockSampleTest *blockSample = [[BlockSampleTest alloc] init];
    [blockSample configureBlock];
    

}

#pragma mark-
#pragma mark Block Declare

-(void)testBlockStorageType{
    
    __block int someValue = 10;
    int (^myOperation)(void) = ^(void){
        someValue += 5;
        return someValue+10;
    };
    
    NSLog(@"%d",myOperation());
}

#pragma mark-
#pragma mark Block As Completion Handlers

-(void)addNumber:(int)number1 WithNumber:(int)number2 andCompletionHandler:(void(^)(int result))completionHandler{
    int result = number1 + number2;
    completionHandler(result);
}

-(void)minusNumber:(int)number1 WithNumber:(int)number2 andCompletionHandler:(void(^)(int result))completionHandler{
    int result = number1 - number2;
    completionHandler(result);
}

    

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
