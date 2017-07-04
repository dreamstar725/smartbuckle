//
//  RegisterEndViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/19/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "RegisterEndViewController.h"

@interface RegisterEndViewController ()

@end

@implementation RegisterEndViewController

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

- (IBAction)toptoconnectBtn_Clicked:(id)sender {
    UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"HomeMoveViewController"];
    [self.navigationController pushViewController:detail animated:YES];
}
@end
