//
//  ViewController.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/6.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()
@property (nonatomic, strong) Calculator *calculator;
@property (weak, nonatomic) IBOutlet UILabel *textDisplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)inputNumber:(UIButton *)sender {
    NSMutableString *str = [NSMutableString stringWithString:self.textDisplay.text];
    
    if ([sender.titleLabel.text isEqualToString:@"÷"]) {
        [self.calculator.disp appendString:@"/"];
    } else if ([sender.titleLabel.text isEqualToString:@"×"]) {
        [self.calculator.disp appendString:@"*"];
    } else {
        [self.calculator.disp appendString:sender.titleLabel.text];
    }
    
    [str appendString:sender.titleLabel.text];
    self.textDisplay.text = str;
}

- (IBAction)clear:(UIButton *)sender {
    self.textDisplay.text = @"";
    [self.calculator clearDisp];
}

- (IBAction)delNumber:(UIButton *)sender {
    long len = self.textDisplay.text.length - 1;
    if (len >= 0) {
        NSMutableString *str = [NSMutableString stringWithString:self.textDisplay.text];
        [str deleteCharactersInRange:NSMakeRange(len, 1)];
        self.textDisplay.text = str;
    }
    
    [self.calculator delNumber];
}

- (IBAction)compute:(UIButton *)sender {
    self.textDisplay.text = [self.calculator computeResult];
}

- (Calculator *)calculator {
    if (!_calculator) {
        _calculator = [[Calculator alloc] init];
    }
    return _calculator;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
