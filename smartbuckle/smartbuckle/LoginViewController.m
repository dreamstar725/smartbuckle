//
//  LoginViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/18/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
- (IBAction)loginBtn_Clicked:(id)sender;
- (IBAction)hereBtn_Clicked:(id)sender;
- (IBAction)resetBtn_Clicked:(id)sender;

@end

@implementation LoginViewController

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


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.cellphoneTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.cellphoneTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
    
    return NO;
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    /* for backspace */
    if([string length]==0){
        return YES;
    }
    /*  limit to only numeric characters  */
    
    NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    for (int i = 0; i < [string length]; i++) {
        unichar c = [string characterAtIndex:i];
        if ([myCharSet characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}



- (IBAction)loginBtn_Clicked:(id)sender {
    
    if (![self.cellphoneTxt.text isEqual:@""] && ![self.passwordTxt.text isEqual:@""]) {
        
        
        
        
        
        UIImage * buttonImage = [UIImage imageNamed:@"loginbuttonC.png"];
        [_login_btn setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"HomeMoveViewController"];
        [self.navigationController pushViewController:detail animated:YES];
    }else{
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Check Again!"
                                     message:@"Please check your entered value again."
                                     preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* yesButton = [UIAlertAction
                                    actionWithTitle:@"Yes"
                                    style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction * action) {
                                        //Handle your yes please button action here
                                    }];
        

        
        [alert addAction:yesButton];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
    

    
}

- (IBAction)hereBtn_Clicked:(id)sender {
    UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"RegisterViewController"];
    [self.navigationController pushViewController:detail animated:YES];
}

- (IBAction)resetBtn_Clicked:(id)sender {
    self.passwordTxt.text=@"";
}
@end
