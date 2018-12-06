//
//  helloworld.m
//  SA18225410_实验1
//
//  Created by SeanCST on 2018/11/29.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "helloworld.h"

@interface helloworld ()
{
    
}
@end

@implementation helloworld 

@synthesize something = _something;

- (void)setSomething:(NSString *)something {
    NSMutableString *str = [NSMutableString stringWithString:something];
    [str appendString:@"😁"];
    _something = str;
}

- (NSString *)something {
    return _something;
}

+ (NSString *)sayHelloworld {
    return @"Hello, world!";
}

- (NSString *)sayHello:(NSString *)greeting {
    NSString *str = @"hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:greeting];
    
    return mstr;
}

- (NSString *)saySomething {
    NSString *str = @"hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:self.something ];
    
    return mstr;
}
@end
