//
//  SecondViewController.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/13.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *advancedDisplayLabel;

@end

@implementation SecondViewController

- (IBAction)inputAction:(UIButton *)sender {
    if (sender.tag == 1 || sender.tag == 2 || sender.tag == 3 || sender.tag == 4) {
        NSMutableString *str = [NSMutableString stringWithString:self.advancedDisplayLabel.text];
        if ([sender.titleLabel.text isEqualToString:@"e"]) {
            [self.advancedCalculator.disp appendString:@"2.7182818"];
        } else if([sender.titleLabel.text isEqualToString:@"pi"]) {
            [self.advancedCalculator.disp appendString:@"3.1415926"];
        } else {
            [self.advancedCalculator.disp appendString:sender.titleLabel.text];
        }
        
        [str appendString:sender.titleLabel.text];
        self.advancedDisplayLabel.text = str;
        self.advancedCalculator.screen = str;
        
        return;
    }
    
    switch (sender.tag) {

        case 5: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator abs:[self.advancedCalculator computeResult]]];
//            self.advancedCalculator.screen = self.advancedCalculator.disp;
//            self.advancedDisplayLabel.text = self.advancedCalculator.screen;
            break;
        }
            
        case 6: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator sqrt:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 7: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator reciprocal:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 8: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator square:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 9: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator sin:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 10: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator cos:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 11: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator tan:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 12: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator cube:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 13: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator asin:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 14: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator acos:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 15: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator atan:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 16: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator ln:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 17: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator sinh:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 18: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator cosh:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 19: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator tanh:[self.advancedCalculator computeResult]]];
            break;
        }
            
        case 20: {
            self.advancedCalculator.disp = [NSMutableString stringWithString:[self.advancedCalculator log:[self.advancedCalculator computeResult]]];
            break;
        }
            
        default:
            break;
    }
    
    self.advancedCalculator.screen = self.advancedCalculator.disp;
    self.advancedDisplayLabel.text = self.advancedCalculator.screen;
}

- (void)viewWillAppear:(BOOL)animated {
    self.advancedDisplayLabel.text = self.advancedCalculator.screen;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
