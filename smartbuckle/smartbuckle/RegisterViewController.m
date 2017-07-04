//
//  RegisterViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/18/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
- (IBAction)gobacktologinBtn_Clicked:(id)sender;

@end

@implementation RegisterViewController

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
    
    [self.fullnameTxt resignFirstResponder];
    [self.cellphoneTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
    [self.reenterpasswordTxt resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.fullnameTxt resignFirstResponder];
    [self.cellphoneTxt resignFirstResponder];
    [self.passwordTxt resignFirstResponder];
    [self.reenterpasswordTxt resignFirstResponder];
    
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


- (IBAction)gobacktologinBtn_Clicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)nextBtnClicked:(id)sender {
    if (![self.fullnameTxt.text isEqual:@""] && ![self.cellphoneTxt.text isEqual:@""] && ![self.passwordTxt.text isEqual:@""] && ![self.reenterpasswordTxt.text isEqual:@""]) {
        if ([_passwordTxt.text isEqual:_reenterpasswordTxt.text]) {
            UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"RegisterGenderViewController"];
            [self.navigationController pushViewController:detail animated:YES];
        }else{
            UIAlertController * alert = [UIAlertController
                                         alertControllerWithTitle:@"Password and ReEnterPassword is not same."
                                         message:@"Please check your password values again."
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

    }else{
        UIAlertController * alert = [UIAlertController
                                     alertControllerWithTitle:@"Check Again!"
                                     message:@"Please check your info value again."
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
@end
