//
//  AdvancedCalculator.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/13.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "AdvancedCalculator.h"

@implementation AdvancedCalculator

- (NSString *)abs:(NSString *)content {
    double d = [content doubleValue];
    double result = d > 0 ? d : 0 - d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)sqrt:(NSString *)content {
    double d = [content doubleValue];
    double result = sqrt(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)reciprocal:(NSString *)content {
    double d = [content doubleValue];
    double result = 1 / d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)square:(NSString *)content {
    double d = [content doubleValue];
    double result = d * d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)sin:(NSString *)content {
    double d = [content doubleValue];
    double result = sin(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)cos:(NSString *)content {
    double d = [content doubleValue];
    double result = cos(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)tan:(NSString *)content {
    double d = [content doubleValue];
    double result = tan(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)cube:(NSString *)content {
    double d = [content doubleValue];
    double result = d * d *d;
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)asin:(NSString *)content {
    double d = [content doubleValue];
    double result = asin(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)acos:(NSString *)content {
    double d = [content doubleValue];
    double result = acos(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)atan:(NSString *)content {
    double d = [content doubleValue];
    double result = atan(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)sinh:(NSString *)content {
    double d = [content doubleValue];
    double result = sinh(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)cosh:(NSString *)content {
    double d = [content doubleValue];
    double result = cosh(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)tanh:(NSString *)content {
    double d = [content doubleValue];
    double result = tanh(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)ln:(NSString *)content {
    double d = [content doubleValue];
    double result = log(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (NSString *)log:(NSString *)content {
    double d = [content doubleValue];
    double result = log10(d);
    NSNumber *n = [[NSNumber alloc] initWithDouble:result];
    
    return [n stringValue];
}

- (void)delNumber {
    long len = self.screen.length - 1;
    if (len >= 0) {
        [self.disp deleteCharactersInRange:NSMakeRange(len, 1)];
        [self.screen deleteCharactersInRange:NSMakeRange(len, 1)];
    }
}

- (void)clearDisp {
    self.disp = nil;
    self.screen = nil;
}

- (NSMutableString *)screen {
    if (!_screen) {
        _screen = [[NSMutableString alloc] init];
    }
    return _screen;
}

@end
