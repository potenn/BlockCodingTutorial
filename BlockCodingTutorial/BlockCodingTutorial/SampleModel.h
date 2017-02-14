//
//  SampleModel.h
//  BlockCodingTutorial
//
//  Created by wenote on 2017. 2. 14..
//  Copyright © 2017년 potenn. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^handler)();

@interface SampleModel : NSObject

@property (nonatomic, strong) handler myBlock;

@end
