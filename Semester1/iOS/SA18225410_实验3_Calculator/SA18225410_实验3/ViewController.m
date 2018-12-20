//
//  ViewController.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/6.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "ViewController.h"
//#import "Calculator.h"
#import "AdvancedCalculator.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (nonatomic, strong) AdvancedCalculator *calculator;
@property (weak, nonatomic) IBOutlet UILabel *textDisplay;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    self.textDisplay.text = self.calculator.screen;
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
    self.calculator.screen = str;
    self.textDisplay.text = str;
}

- (IBAction)clear:(UIButton *)sender {
    self.textDisplay.text = @"";
    [self.calculator clearDisp];
}

- (IBAction)delNumber:(UIButton *)sender {
//    long len = self.textDisplay.text.length - 1;
//    if (len >= 0) {
//        NSMutableString *str = [NSMutableString stringWithString:self.textDisplay.text];
//        [str deleteCharactersInRange:NSMakeRange(len, 1)];
//        self.textDisplay.text = str;
//    }
    
    [self.calculator delNumber];
    self.textDisplay.text = self.calculator.screen;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"SecondScene"]) {
        if ([segue.destinationViewController isKindOfClass:[SecondViewController class]]) {
            SecondViewController *svc = (SecondViewController *)segue.destinationViewController;
            svc.advancedCalculator = self.calculator;
        }
    }
}

- (IBAction)compute:(UIButton *)sender {
    self.textDisplay.text = [self.calculator computeResult];
    self.calculator.screen = [NSMutableString stringWithString:self.textDisplay.text];
}

- (AdvancedCalculator *)calculator {
    if (!_calculator) {
        _calculator = [[AdvancedCalculator alloc] init];
    }
    return _calculator;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
