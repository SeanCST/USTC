//
//  TableViewController.h
//  SA18225410_肖恩伟_实验4
//
//  Created by SeanCST on 2018/12/20.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
- (void)writeToFile:(NSMutableArray *)sts FilePath:(NSString *)path;
@end
