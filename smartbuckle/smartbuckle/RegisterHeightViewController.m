//
//  RegisterHeightViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/19/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "RegisterHeightViewController.h"
#import "RegisterGenderViewController.h"

@interface RegisterHeightViewController () 
- (IBAction)feetbtn_Clicked:(id)sender;
- (IBAction)inchBtn_Clicked:(id)sender;
- (IBAction)backBtn_Clicked:(id)sender;

@end

@implementation RegisterHeightViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.groupview.layer.cornerRadius=20;
    self.groupview.layer.borderWidth=1.0;
    _delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    _heightunit.text=@"'  ''";
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
-(void)viewDidAppear:(BOOL)animated {
    _delegate.height_inch=@"";
    _delegate.height_feet=@"";
    _delegate.height_cm=@"";
    _heightunit.text=@"'  ''";

    
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.inchTxt resignFirstResponder];
    [self.feetTxt resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.inchTxt resignFirstResponder];
    [self.feetTxt resignFirstResponder];
    return NO;
}



- (IBAction)feetbtn_Clicked:(id)sender {
    [_feetTxt becomeFirstResponder];
}

- (IBAction)inchBtn_Clicked:(id)sender {
    [_inchTxt becomeFirstResponder];
}

- (IBAction)backBtn_Clicked:(id)sender {

    _delegate.height_feet = self.feetTxt.text;
    _delegate.height_inch=self.inchTxt.text;
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)dataFromController:(NSString *)data
{
    self.feetTxt.text = data;
}

@end
