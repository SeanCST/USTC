//
//  ViewController.m
//  SA18225410_实验2
//
//  Created by SeanCST on 2018/11/29.
//  Copyright © 2018 肖恩伟. All rights reserved.
//

#import "ViewController.h"
#import "helloworld.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btn1Clicked:(id)sender {
    self.label.text = [helloworld sayHelloworld];
}

- (IBAction)btn2Clicked:(id)sender {
    helloworld *h = [[helloworld alloc] init];
    self.label.text = [h sayHello:@"iOS world!"];
}

- (IBAction)btn3Clicked:(id)sender {
    helloworld *h = [[helloworld alloc] init];
    h.something = self.textField.text;
    self.label.text = [h saySomething];
    
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.textField) {
        [textField resignFirstResponder];
    }
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
