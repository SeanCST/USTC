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
        NSExpression *exp1 = [NSExpression expressionWithFormat:[self dispConvertToFloat]];
        id value = [exp1 expressionValueWithObject:nil context:nil];
        self.disp = [NSMutableString stringWithString:[value stringValue]];
        
        NSLog(@"%@", self.disp);
        
        return [value stringValue];
        
    } @catch (NSException *exception) {
        self.disp = nil;
        return @"error";
    }
}

- (NSString *)dispConvertToFloat {
    NSMutableString *floatStr = self.disp;
//    floatStr = [floatStr stringByReplacingOccurrencesOfString:@"+" withString:@".0+"];
//    floatStr = [floatStr stringByReplacingOccurrencesOfString:@"-" withString:@".0-"];
//    floatStr = [floatStr stringByReplacingOccurrencesOfString:@"*" withString:@".0*"];
//    floatStr = [floatStr stringByReplacingOccurrencesOfString:@"/" withString:@".0/"];
//    floatStr = [floatStr stringByAppendingString:@".0"];
    
    for (int i = 0; i < floatStr.length; i++) {
        NSString *s = [floatStr substringWithRange:NSMakeRange(i, 1)];
        if ([s isEqualToString:@"." ]) {
            break;
        }
        
        if ([s isEqualToString:@"/"] || [s isEqualToString:@"*"] || [s isEqualToString:@"+"] || [s isEqualToString:@"-"] || [s isEqualToString:@")"]) {
            [floatStr insertString:@".0" atIndex:i];
            break;
        }
    }
    
    return floatStr;
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
