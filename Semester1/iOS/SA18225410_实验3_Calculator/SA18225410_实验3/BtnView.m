//
//  BtnView.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/6.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "BtnView.h"

@implementation BtnView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.layer setCornerRadius:12.0f];
    [self.layer setBorderWidth:1.0f];
    [self.layer setMasksToBounds:YES];
}

@end
