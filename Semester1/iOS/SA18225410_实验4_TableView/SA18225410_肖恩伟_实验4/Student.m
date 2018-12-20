//
//  Student.m
//  SA18225410_肖恩伟_实验4
//
//  Created by SeanCST on 2018/12/20.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.number = [aDecoder decodeObjectForKey:@"number"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.score = [aDecoder decodeFloatForKey:@"score"];
        self.memo = [aDecoder decodeObjectForKey:@"memo"];
        self.teacher = [aDecoder decodeObjectForKey:@"teacher"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.number forKey:@"number"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeFloat:self.score forKey:@"score"];
    [aCoder encodeObject:self.memo forKey:@"memo"];
    [aCoder encodeObject:self.teacher forKey:@"teacher"];
}

@end
