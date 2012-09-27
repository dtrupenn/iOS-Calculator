//
//  CALCViewController.h
//  Calculator
//
//  Created by Daniel Trujillo on 9/24/12.
//  Copyright (c) 2012 CALC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CALCViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textField;
- (IBAction)CEbutton:(id)sender;
- (IBAction)DELbutton:(id)sender;
- (IBAction)SIGNbutton:(id)sender;
- (IBAction)DIVbutton:(id)sender;
- (IBAction)MULbutton:(id)sender;
- (IBAction)ADDbutton:(id)sender;
- (IBAction)SUBbutton:(id)sender;
- (IBAction)EQUbutton:(id)sender;
- (IBAction)DEVbutton:(id)sender;
- (IBAction)zeroButton:(id)sender;
- (IBAction)oneButton:(id)sender;
- (IBAction)twoButton:(id)sender;
- (IBAction)threeButton:(id)sender;
- (IBAction)fourButton:(id)sender;
- (IBAction)fiveButton:(id)sender;
- (IBAction)sixButton:(id)sender;
- (IBAction)sevenButton:(id)sender;
- (IBAction)eightButton:(id)sender;
- (IBAction)nineButton:(id)sender;

@end
