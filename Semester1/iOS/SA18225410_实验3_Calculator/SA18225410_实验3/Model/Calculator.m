//
//  Calculator.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/6.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator


- (void)delNumber {
    long len = self.disp.length - 1;
    if (len >= 0) {
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)]; 
    }
}

- (NSString *)computeResult {
    @try {
        NSExpression *exp1 = [NSExpression expressionWithFormat:self.disp];
        id value = [exp1 expressionValueWithObject:nil context:nil];
        self.disp = [NSMutableString stringWithString:[value stringValue]];
        
        NSLog(@"%@", self.disp);
        
        return [value stringValue];
        
    } @catch (NSException *exception) {
        self.disp = nil;
        return @"error";
    }
}

- (NSMutableString *)disp {
    if (!_disp) {
        _disp = [[NSMutableString alloc] init];
    }
    return _disp;
}

- (void)clearDisp {
    self.disp = nil;
}

@end
