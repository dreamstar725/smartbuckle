//
//  RegisterHeightViewController.h
//  smartbuckle
//
//  Created by ForStar on 1/19/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegisterHeightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *groupview;
@property (weak, nonatomic) IBOutlet UITextField *inchTxt;
@property (weak, nonatomic) IBOutlet UITextField *feetTxt;
@property (weak, nonatomic) IBOutlet UILabel *heightunit;
@property (weak, nonatomic) IBOutlet UIButton *cmButton;
@property (weak, nonatomic) IBOutlet UIButton *feetButton;
@property (weak, nonatomic) IBOutlet UIButton *inchButton;




@property (weak, nonatomic) AppDelegate *delegate;
@end
