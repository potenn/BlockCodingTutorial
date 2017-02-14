//
//  BlockSampleTest.h
//  BlockCodingTutorial
//
//  Created by wenote on 2017. 2. 13..
//  Copyright © 2017년 potenn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SampleModel.h"

typedef void (^ResponseBlock)(int a, int b);

typedef int (^test)(int a);

typedef void (^handler)();

@interface BlockSampleTest : NSObject

@property (nonatomic, strong) ResponseBlock responseBlock;

- (void)configureBlock;

- (void)startRequestWithCompletion:(ResponseBlock)responseBlock;


- (void)calcTime:(handler)handler;

- (void)preventBlockRetainCycle;

@property (nonatomic,strong) SampleModel *model;

@end
