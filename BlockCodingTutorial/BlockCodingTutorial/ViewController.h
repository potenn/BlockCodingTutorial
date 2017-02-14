//
//  ViewController.h
//  BlockCodingTutorial
//
//  Created by wenote on 2017. 1. 26..
//  Copyright © 2017년 potenn. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "BlockSampleTest.h"

@interface ViewController : UIViewController

/*
 Return Type ^blockName Parameters
 */
@property (nonatomic, strong) NSString* (^blockAsMemberVar)(void);

#pragma mark-
#pragma mark Block Declare

-(void)testBlockStorageType;

#pragma mark-
#pragma mark Block As Completion Handlers

-(void)addNumber:(int)number1 WithNumber:(int)number2 andCompletionHandler:(void(^)(int result))completionHandler;

@end

