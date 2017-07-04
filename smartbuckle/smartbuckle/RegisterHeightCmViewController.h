//
//  RegisterHeightCmViewController.h
//  smartbuckle
//
//  Created by ForStar on 1/23/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface RegisterHeightCmViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *heightunit;
@property (weak, nonatomic) IBOutlet UITextField *heightvalue;
@property (weak, nonatomic) AppDelegate *delegate;

@end
