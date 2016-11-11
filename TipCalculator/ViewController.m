//
//  ViewController.m
//  TipCalculator
//
//  Created by Ali Dahesh on 2016-11-11.
//  Copyright © 2016 Ali Dahesh. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountField;

@property (weak, nonatomic) IBOutlet UILabel *tipAmountLable;

@property (weak, nonatomic) IBOutlet UITextField *tipPercentageTextField;

@property (weak, nonatomic) IBOutlet UISlider *tipPercentageSlider;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _billAmountField.delegate = self;
    _tipPercentageTextField.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)CalculateTipButton:(id)sender {
    
    [self.view endEditing:YES];

    float billAmount = [self.billAmountField.text floatValue];
    
    //int percentage = [self.tipPercentageTextField.text intValue];
    
    int percentageSlider = self.tipPercentageSlider.value;
    
    TipCalculator *tipCalculator = [TipCalculator new];
    float calculatedTip = [tipCalculator calculateTip:billAmount:percentageSlider];
    
    self.tipAmountLable.text = [NSString stringWithFormat : @"%f",calculatedTip];
    
  
    
    // Create a new tip calculator object
    
    // Calculate the tip using that object
    
    // Update the lable using the calculated tip
    
    
//    [self.tipAmountLable calculateTip:billAmount];
    
    
}

- (IBAction)sliderValueChanged:(id)sender
{
    // Set the label text to the value of the slider as it changes
    self.tipAmountLable.text = [NSString stringWithFormat:@"%f", self.tipPercentageSlider.value];
}



#pragma mark - Textfield Delegate Methods

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyboard) name:UIKeyboardDidShowNotification object:nil];
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyboard) name:UIKeyboardDidHideNotification object:nil];
    return YES;
}

#pragma mark - Keyboard Handling
-(void)showKeyboard
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.view setFrame:CGRectMake(0,-110,self.view.frame.size.width,self.view.frame.size.height)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }];
}

-(void)hideKeyboard
{
    [UIView animateWithDuration:0.5 animations:^{
        [self.view setFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)]; //here taken -110 for example i.e. your view will be scrolled to -110. change its value according to your requirement.
    }];
}

@end
