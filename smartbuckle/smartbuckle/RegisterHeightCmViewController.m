//
//  RegisterHeightCmViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/23/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "RegisterHeightCmViewController.h"

@interface RegisterHeightCmViewController ()
- (IBAction)cmBtn_Clicked:(id)sender;
- (IBAction)backBtn_Clicked:(id)sender;

@end

@implementation RegisterHeightCmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    _delegate.height_inch=@"";
    _delegate.height_feet=@"";
    _delegate.height_cm=@"";
    

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
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.heightvalue resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.heightvalue resignFirstResponder];
    return NO;
}
- (IBAction)cmBtn_Clicked:(id)sender {
    [_heightvalue becomeFirstResponder];

}

- (IBAction)backBtn_Clicked:(id)sender {
    _delegate.height_cm=_heightvalue.text;
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
