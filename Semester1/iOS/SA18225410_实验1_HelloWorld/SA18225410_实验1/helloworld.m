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

+ (void)sayHelloworld {
    NSLog(@"Hello, world!");
}

- (void)sayHello:(NSString *)greeting {
    NSString *str = @"hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:greeting];
    NSLog(@"%@", mstr);
}

- (void)saySomething {
    NSString *str = @"hello ";
    NSMutableString *mstr = [NSMutableString stringWithString:str];
    [mstr appendString:self.something ];
    NSLog(@"%@", mstr);
}
@end
