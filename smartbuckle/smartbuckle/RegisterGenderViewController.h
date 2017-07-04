//
//  RegisterGenderViewController.h
//  smartbuckle
//
//  Created by ForStar on 1/18/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"


@interface RegisterGenderViewController : UIViewController<UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIView *groupview;
@property (weak, nonatomic) IBOutlet UILabel *genderTxt;
@property (weak, nonatomic) IBOutlet UILabel *unitsTxt;
@property (weak, nonatomic) IBOutlet UILabel *weightTxt;
@property (weak, nonatomic) IBOutlet UILabel *heightTxt;
@property (weak, nonatomic) AppDelegate *delegate;
@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

@end
