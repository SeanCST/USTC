//
//  Calculator+Health.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/13.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "Calculator+Health.h"

@implementation Calculator (Health)

- (NSString *)computeHealthWithHeight:(NSString *)height andWeight:(NSString *)weight {
    NSMutableString *expression = [NSMutableString stringWithFormat:@"%@/((%@/100.0)*(%@/100.0))", weight, height, height];
    
    self.disp = expression;
    return [NSString stringWithFormat:@"%.2f", [[self computeResult] floatValue]];
}

@end
