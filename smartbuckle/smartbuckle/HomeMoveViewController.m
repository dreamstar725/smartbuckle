//
//  HomeMoveViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/19/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "HomeMoveViewController.h"

@interface HomeMoveViewController ()
{
    NSString *flag;
    NSString *fLag;
}
@end

@implementation HomeMoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    flag=@"0";
    fLag=@"0";
    self.m1valueheight.constant=195;
    self.m2valueheight.constant=172;
    self.m3valueheight.constant=143;
    self.m4valueheight.constant=188;
    self.m5valueheight.constant=170;
    self.m6valueheight.constant=160;
    self.m7valueheight.constant=184;
    
    self.d1value.constant=181;
    self.d2value.constant=161;
    self.d3value.constant=101;
    self.d4value.constant=111;
    self.d5value.constant=11;
    self.d6value.constant=131;
    self.d7value.constant=21;
    self.d8value.constant=151;
    self.d9value.constant=171;
    self.d10value.constant=81;
    self.d11value.constant=141;
    self.d12value.constant=131;
    self.d13value.constant=181;
    self.d14value.constant=21;
    self.d15value.constant=61;
    self.d16value.constant=141;
    self.d17value.constant=181;
    self.d18value.constant=11;
    self.d19value.constant=81;
    self.d20value.constant=131;
    self.d21value.constant=81;
    self.d22value.constant=161;
    self.d23value.constant=141;
    self.d24value.constant=111;
    self.d25value.constant=81;
    self.d26value.constant=11;
    self.d27value.constant=191;
    self.d28value.constant=131;
    self.d29value.constant=51;
    self.d30value.constant=201;

    // Do any additional setup after loading the view.

    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self  action:@selector(didSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]  initWithTarget:self action:@selector(didSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    
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

- (void)didSwipe:(UISwipeGestureRecognizer*)swipe{
    
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft) {
        if ([flag isEqual:@"0"]) {
            [self showAnimationView_A:_MovePageView];
            [self showAnimationView_C:_SleepPageView];


            flag=@"2";
        }
        if ([flag isEqual:@"1"]) {
            [self showAnimationView_A:_SettingPageView];
            [self showAnimationView_C:_MovePageView];

            flag=@"0";
        }
        if ([flag isEqual:@"2"]) {
            //NSLog(@"Swipe Left");
        }


    } else if (swipe.direction == UISwipeGestureRecognizerDirectionRight) {
        if ([flag isEqual:@"0"]) {
            [self showAnimationView_D:_MovePageView];
            [self showAnimationView_B:_SettingPageView];


            flag=@"1";
        }
        if ([flag isEqual:@"1"]) {
            //NSLog(@"Swipe Right");
        }
        if([flag isEqual:@"2"]){
            [self showAnimationView_D:_SleepPageView];
            [self showAnimationView_B:_MovePageView];

            flag=@"0";
        }
       
    } else if (swipe.direction == UISwipeGestureRecognizerDirectionUp) {
        
        if ([fLag isEqual:@"0"]) {
            [self showAnimationView_a:_MovePageView];
            [self showAnimationView_c:_WeekPageView];
            fLag=@"1";
            return;
        }
        
        if ([fLag isEqual:@"1"]) {
            [self showAnimationView_a:_WeekPageView];
            [self showAnimationView_c:_MonthPageView];
            fLag=@"2";
            return;
        }


    } else if (swipe.direction == UISwipeGestureRecognizerDirectionDown) {
        
        if([fLag isEqual:@"0"]){
            
        }
        
        if ([fLag isEqual: @"1"]) {
            [self showAnimationView_b:_MovePageView];
            [self showAnimationView_d:_WeekPageView];
            fLag=@"0";
            return;
        }
        
        if ([fLag isEqual:@"2"]) {
            [self showAnimationView_d:_MonthPageView];
            [self showAnimationView_b:_WeekPageView];
            fLag=@"1";
            return;
        }

    }
}


- (void)showAnimationView_A:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(0, view.frame.origin.y, -view.frame.size.width, view.frame.size.height);

        
    } completion:^(BOOL finished) { }];
    
}
- (void)showAnimationView_B:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        //        view.frame = CGRectMake(self.view.frame.size.width-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        view.frame = CGRectMake(0, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        
    } completion:^(BOOL finished) { }];
    
}
- (void)showAnimationView_C:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(0, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        
        
    } completion:^(BOOL finished) { }];
    
}
- (void)showAnimationView_D:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        //        view.frame = CGRectMake(self.view.frame.size.width-view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        view.frame = CGRectMake(self.view.frame.size.width, view.frame.origin.y, view.frame.size.width, view.frame.size.height);
        
    } completion:^(BOOL finished) { }];
    
    
}

- (void)showAnimationView_a:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y-view.frame.size.height, view.frame.size.width, view.frame.size.height);
        
    } completion:^(BOOL finished) { }];
    
}
- (void)showAnimationView_b:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, view.frame.size.width, view.frame.size.height);
    } completion:^(BOOL finished) { }];
    
}
- (void)showAnimationView_c:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(view.frame.origin.x, 0, view.frame.size.width, view.frame.size.height);
        
    } completion:^(BOOL finished) { }];
    
}

- (void)showAnimationView_d:(UIView *) view{
    [UIView animateWithDuration:0.3 animations:^{
        view.frame = CGRectMake(view.frame.origin.x, view.frame.size.height, view.frame.size.width, view.frame.size.height);
        
    } completion:^(BOOL finished) { }];
    
}


//- (void)showAnimationView_a:(UIView *) view{
//    [UIView animateWithDuration:0.3 animations:^{
//        view.frame = CGRectMake(view.frame.origin.x, self.view.frame.size.height-view.frame.size.height, view.frame.size.width, view.frame.size.height);
//
//    } completion:^(BOOL finished) { }];
//    
//}
//- (void)showAnimationView_b:(UIView *) view{
//    [UIView animateWithDuration:0.3 animations:^{
//        view.frame = CGRectMake(view.frame.origin.x, self.view.frame.size.height, view.frame.size.width, view.frame.size.height);
//    } completion:^(BOOL finished) { }];
//    
//}
//- (void)showAnimationView_c:(UIView *) view{
//    [UIView animateWithDuration:0.3 animations:^{
//        view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.x-view.frame.size.height, view.frame.size.width, view.frame.size.height);
//        
//    } completion:^(BOOL finished) { }];
//    
//}




@end
