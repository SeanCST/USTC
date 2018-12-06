//
//  Calculator.h
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/6.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject
@property (nonatomic, strong) NSMutableString *disp;

- (void)delNumber;
- (NSString *)computeResult;
- (void)clearDisp;

@end
