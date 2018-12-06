//
//  main.m
//  SA18225410_实验1
//
//  Created by SeanCST on 2018/11/29.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "helloworld.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        [helloworld sayHelloworld];
        
        helloworld *h = [[helloworld alloc] init];
        h.something = @"iOS world";
        [h sayHello:@"iOS"];
        [h saySomething];
    }
    return 0;
}
