//
//  AppDelegate.h
//  smartbuckle
//
//  Created by ForStar on 1/18/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSString *height_feet;
@property (strong, nonatomic) NSString *height_inch;
@property (strong, nonatomic) NSString *height_cm;


@property (strong, nonatomic) NSString *weight_us;
@property (strong, nonatomic) NSString *weight_uk;

@property (strong, nonatomic) NSString *gender;
@property (strong, nonatomic) NSString *units;


@end

