//
//  RegisterWeightViewController.h
//  smartbuckle
//
//  Created by ForStar on 1/19/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegisterWeightViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *groupview;
@property (weak, nonatomic) AppDelegate *delegate;
@property (weak, nonatomic) IBOutlet UITextField *weightTxt;
@property (weak, nonatomic) IBOutlet UILabel *weightunitLab;

@end
