//
//  RegisterGenderViewController.m
//  smartbuckle
//
//  Created by ForStar on 1/18/17.
//  Copyright © 2017 ForStar. All rights reserved.
//

#import "RegisterGenderViewController.h"
#import "math.h"

@interface RegisterGenderViewController ()
- (IBAction)genderBtn_Clicked:(id)sender;
- (IBAction)unitsBtn_Clicked:(id)sender;
- (IBAction)heightBtn_Clicked:(id)sender;

- (IBAction)weightBtn_Clicked:(id)sender;
- (IBAction)nextBtn_Clicked:(id)sender;
- (IBAction)backBtn_Clicked:(id)sender;

@end

@implementation RegisterGenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.groupview.layer.cornerRadius=20;
    self.groupview.layer.borderWidth=1.0;
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated {
    self.groupview.layer.cornerRadius=20;
    self.groupview.layer.borderWidth=1.0;
    UIImage * buttonImage = [UIImage imageNamed:@"nextbutton.png"];
    [_nextBtn setBackgroundImage:buttonImage forState:UIControlStateNormal];
    
    _delegate=(AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    
    
    if ([_delegate.units isEqual:@"Metric US"]) {
        _unitsTxt.text=_delegate.units;

        if (![_delegate.height_cm isEqual:@""]) {
            self.heightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.height_cm,@"Cm"];
        }else{
            _heightTxt.text=@"Cm";
        }

        if (![_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]) {
            float value_feet = [_delegate.height_feet floatValue];
            float value_inch=[_delegate.height_inch floatValue];
            int weight_value=(int)(30.48*value_feet+2.54*value_inch+0.5);
            self.heightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Cm"];
            
        }else if (![_delegate.height_feet isEqual:@""] && [_delegate.height_inch isEqual:@""]){
            float value_feet = [_delegate.height_feet floatValue];
            int weight_value=(int)(30.48*value_feet+0.5);
            self.heightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Cm"];
        }else if ([_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]){
            float value_inch=[_delegate.height_inch floatValue];
            int weight_value=(int)(2.54*value_inch+0.5);
            self.heightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Cm"];
        }
        
        if (![_delegate.weight_us isEqual:@""]) {
            self.weightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.weight_us,@"Kg"];
        }else{
            _weightTxt.text=@"Kg";
        }
    }
    if ([_delegate.units isEqual:@"Imperial UK"]) {
        _unitsTxt.text=_delegate.units;
        
        if (![_delegate.height_cm isEqual:@""]) {
            float cmvalue=[_delegate.height_cm floatValue];
            const float INCH_IN_CM = 2.54;
            NSInteger numInches = (NSInteger) roundf(cmvalue / INCH_IN_CM);
            NSInteger feet = numInches / 12;
            NSInteger inches = numInches % 12;
            
            self.heightTxt.text=[NSString stringWithFormat:@"%ld %@ %ld %@",(long)feet,@"'",(long)inches,@"''"];
        }else if (![_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]) {
            self.heightTxt.text=[NSString stringWithFormat:@"%@ %@ %@ %@",_delegate.height_feet,@"'",_delegate.height_inch,@"''"];
        }else if (![_delegate.height_feet isEqual:@""] && [_delegate.height_inch isEqual:@""]){
            self.heightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.height_feet,@"'"];
        }else if ([_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]){
            self.heightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.height_inch,@"''"];
        }else{
            _heightTxt.text=@"' ''";
        }

        
        
        
        if (![_delegate.weight_uk isEqual:@""]) {
            self.weightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.weight_uk,@"lbs"];
        }else{
            _weightTxt.text=@"lbs";
        }
    }

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

- (IBAction)genderBtn_Clicked:(id)sender {
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Male",
                            @"Female",
                            nil];
    
    popup.tag = 1;
    [popup showInView:self.view];
}

- (IBAction)unitsBtn_Clicked:(id)sender {
    UIActionSheet *popup = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:
                            @"Imperial UK",
                            @"Metric US",
                            nil];
    popup.tag = 2;
    [popup showInView:self.view];
}

- (IBAction)heightBtn_Clicked:(id)sender {
    if ([_delegate.units isEqual:@"Metric US"]) {
        UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"RegisterHeightCmViewController"];
        [self.navigationController pushViewController:detail animated:YES];
    }
    if ([_delegate.units isEqual:@"Imperial UK"]) {
        UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"RegisterHeightViewController"];
        [self.navigationController pushViewController:detail animated:YES];
    }
}

- (IBAction)weightBtn_Clicked:(id)sender {
    UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"RegisterWeightViewController"];
    [self.navigationController pushViewController:detail animated:YES];
}

- (IBAction)nextBtn_Clicked:(id)sender {
    
    if ((![_delegate.height_feet isEqual:@""] || ![_delegate.height_inch isEqual:@"" ] || ![_delegate.height_cm isEqual:@""]) && (![_delegate.weight_uk isEqual:@""] ||![_delegate.weight_us isEqual:@""])) {
        UIImage * buttonImage = [UIImage imageNamed:@"nextbuttonC.png"];
        [_nextBtn setBackgroundImage:buttonImage forState:UIControlStateNormal];
        UIViewController * detail = [self.storyboard instantiateViewControllerWithIdentifier: @"RegisterEndViewController"];
        [self.navigationController pushViewController:detail animated:YES];
        
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

- (IBAction)backBtn_Clicked:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)actionSheet:(UIActionSheet *)popup clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (popup.tag) {
        case 1: {
            switch (buttonIndex) {
                case 0:
                    self.genderTxt.text=@"Male";
                    _delegate.gender=@"Male";
                    
                    break;
                case 1:
                    self.genderTxt.text=@"Female";
                    _delegate.gender=@"Female";
                    break;


                default:
                    break;
            }
            break;
        }
        case 2: {
            switch (buttonIndex) {
                    
                case 1:
                    self.unitsTxt.text=@"Metric US";
                    _delegate.units=@"Metric US";

                    
                    if (![_delegate.height_cm isEqual:@""]) {
                        self.heightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.height_cm,@"Cm"];
                    }else{
                        _heightTxt.text=@"Cm";
                    }
                    if (![_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]) {
                        float value_feet = [_delegate.height_feet floatValue];
                        float value_inch=[_delegate.height_inch floatValue];
                        int weight_value=(int)(30.48*value_feet+2.54*value_inch+0.5);
                        self.heightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Cm"];
                        
                    }else if (![_delegate.height_feet isEqual:@""] && [_delegate.height_inch isEqual:@""]){
                        float value_feet = [_delegate.height_feet floatValue];
                        int weight_value=(int)(30.48*value_feet+0.5);
                        self.heightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Cm"];
                    }else if ([_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]){
                        float value_inch=[_delegate.height_inch floatValue];
                        int weight_value=(int)(2.54*value_inch+0.5);
                        self.heightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Cm"];
                    }
                    
                    if (![_delegate.weight_uk isEqual:@""]) {
                        float value = [_delegate.weight_uk floatValue];
                        int weight_value=(int)(0.453592*value+0.5);
                        self.weightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"Kg"];
                        _delegate.weight_uk=@"";
                        _delegate.weight_us=[NSString stringWithFormat:@"%d",weight_value];
                        
                    }else{
                        _weightTxt.text=@"Kg";

                    }
                    
                    break;
                    
                    
                default:
                    break;
                    
                case 0:
                    self.unitsTxt.text=@"Imperial UK";
                    _delegate.units=@"Imperial UK";
                    if (![_delegate.height_cm isEqual:@""]) {
                        float cmvalue=[_delegate.height_cm floatValue];
                        const float INCH_IN_CM = 2.54;
                        NSInteger numInches = (NSInteger) roundf(cmvalue / INCH_IN_CM);
                        NSInteger feet = numInches / 12;
                        NSInteger inches = numInches % 12;
                        
                        self.heightTxt.text=[NSString stringWithFormat:@"%ld %@ %ld %@",(long)feet,@"'",(long)inches,@"''"];
                    }else if(![_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]) {
                        self.heightTxt.text=[NSString stringWithFormat:@"%@ %@ %@ %@",_delegate.height_feet,@"'",_delegate.height_inch,@"''"];
                    }else if (![_delegate.height_feet isEqual:@""] && [_delegate.height_inch isEqual:@""]){
                        self.heightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.height_feet,@"'"];
                    }else if ([_delegate.height_feet isEqual:@""] && ![_delegate.height_inch isEqual:@""]){
                        self.heightTxt.text=[NSString stringWithFormat:@"%@ %@",_delegate.height_inch,@"''"];
                    }else{
                        _heightTxt.text=@"' ''";

                    }
                    if (![_delegate.weight_us isEqual:@""]) {
                        float value = [_delegate.weight_us floatValue];
                        int weight_value=(int)(2.20462*value+0.5);
                        self.weightTxt.text=[NSString stringWithFormat:@"%d %@",weight_value,@"lbs"];
                        _delegate.weight_us=@"";
                        _delegate.weight_uk=[NSString stringWithFormat:@"%d",weight_value];
                    }else{
                        _weightTxt.text=@"lbs";
                    }
                    
                    break;
                    

            }
            break;
        }
        default:
            break;
    }
}

@end
