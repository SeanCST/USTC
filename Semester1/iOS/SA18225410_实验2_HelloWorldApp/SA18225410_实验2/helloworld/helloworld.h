//
//  helloworld.h
//  SA18225410_实验1
//
//  Created by SeanCST on 2018/11/29.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

@interface helloworld : NSObject
@property (nonatomic, strong) NSString *something;

+ (NSString *)sayHelloworld;
- (NSString *)sayHello:(NSString *)greeting;
- (NSString *)saySomething;

@end
