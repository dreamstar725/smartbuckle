//
//  RegisterViewController.h
//  smartbuckle
//
//  Created by ForStar on 1/18/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *fullnameTxt;
@property (weak, nonatomic) IBOutlet UITextField *cellphoneTxt;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxt;
@property (weak, nonatomic) IBOutlet UITextField *reenterpasswordTxt;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;
@end
