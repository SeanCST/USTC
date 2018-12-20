//
//  ViewController.m
//  SA18225410_肖恩伟_实验4
//
//  Created by SeanCST on 2018/12/20.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "TableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextView;
@property (weak, nonatomic) IBOutlet UITextField *numberTextView;
@property (weak, nonatomic) IBOutlet UITextField *ageTextView;
@property (weak, nonatomic) IBOutlet UITextField *scoreTextView;
@property (weak, nonatomic) IBOutlet UITextView *memoTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.indexPath != nil) {
        Student *s = self.students[self.indexPath.row];
        self.nameTextView.text = s.name;
        self.numberTextView.text = s.number;
        self.ageTextView.text = [NSString stringWithFormat:@"%ld", s.age];
        self.scoreTextView.text = [NSString stringWithFormat:@"%f", s.score];
        self.memoTextView.text = s.memo;
    }
}

- (IBAction)dataSave:(UIButton *)sender {
    
    Student *s = [[Student alloc] init];
    s.name = self.nameTextView.text;
    s.number = self.numberTextView.text;
    s.age = [self.ageTextView.text integerValue];
    s.score = [self.scoreTextView.text floatValue];
    s.memo = self.memoTextView.text;
    s.teacher = @"Tian Bai";

    TableViewController *tc = [[TableViewController alloc] init];
    if (self.indexPath == nil) {
        [self.students addObject:s];
        [tc writeToFile:self.students FilePath:self.path];
    } else {
        self.students[self.indexPath.row] = s;
        [tc writeToFile:self.students FilePath:self.path];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)dataClear:(UIButton *)sender {
    self.nameTextView.text = nil;
    self.numberTextView.text = nil;
    self.ageTextView.text = nil;
    self.scoreTextView.text = nil;
    self.memoTextView.text = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
