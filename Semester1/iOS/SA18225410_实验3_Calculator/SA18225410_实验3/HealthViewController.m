//
//  HealthViewController.m
//  SA18225410_实验3
//
//  Created by SeanCST on 2018/12/13.
//  Copyright © 2018 NilOrg. All rights reserved.
//

#import "HealthViewController.h"
#import "Calculator+Health.h"

@interface HealthViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtHeight;
@property (weak, nonatomic) IBOutlet UITextField *txtWeight;
@property (weak, nonatomic) IBOutlet UILabel *labelAdvice;
@property (weak, nonatomic) IBOutlet UILabel *labelScore;


@property (nonatomic, strong) Calculator *cal;


@end

@implementation HealthViewController


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)computeAction:(id)sender {
    NSString *score = [self.cal computeHealthWithHeight:self.txtHeight.text andWeight:self.txtWeight.text];
    if ([score floatValue] < 19) {
        self.labelAdvice.text = @"太苗条了，需要增加营养。";
    } else if ([score floatValue] < 25) {
        self.labelAdvice.text = @"你的身材太棒了。";
    } else if ([score floatValue] < 30) {
        self.labelAdvice.text = @"有点发福，需要锻炼了。";
    } else if ([score floatValue] < 39) {
        self.labelAdvice.text = @"看来你是一个吃货，快锻炼吧，你已经很胖了。";
    } else {
        self.labelAdvice.text = @"再不减肥，你将和死神有个约会。";
    }
    
    self.labelScore.text = score;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtHeight || textField == self.txtWeight) {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Calculator *)cal {
    if (!_cal) {
        _cal = [[Calculator alloc] init];
    }
    return _cal;
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
