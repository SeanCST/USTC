//
//  AdvancedCalculator.h
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/13.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "Calculator.h"
#import <math.h>

@interface AdvancedCalculator : Calculator

@property (nonatomic, strong) NSMutableString *screen;

- (NSString *)abs:(NSString *)content;

- (NSString *)sqrt:(NSString *)content;

- (NSString *)reciprocal:(NSString *)content;

- (NSString *)square:(NSString *)content;

- (NSString *)sin:(NSString *)content;

- (NSString *)cos:(NSString *)content;

- (NSString *)tan:(NSString *)content;

- (NSString *)cube:(NSString *)content;

- (NSString *)asin:(NSString *)content;

- (NSString *)acos:(NSString *)content;

- (NSString *)atan:(NSString *)content;

- (NSString *)sinh:(NSString *)content;

- (NSString *)cosh:(NSString *)content;

- (NSString *)tanh:(NSString *)content;

- (NSString *)ln:(NSString *)content;

- (NSString *)log:(NSString *)content;
@end
