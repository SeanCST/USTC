//
//  Student.h
//  SA18225410_肖恩伟_实验4
//
//  Created by SeanCST on 2018/12/20.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject <NSCoding>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) float score;
@property (nonatomic, copy) NSString *memo;
@property (nonatomic, copy) NSString *teacher;

@end
