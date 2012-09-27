//
//  CALCViewController.m
//  Calculator
//
//  Created by Daniel Trujillo on 9/24/12.
//  Copyright (c) 2012 CALC. All rights reserved.
//

#import "CALCViewController.h"

@interface CALCViewController ()

@property NSMutableString *currentVal;
@property NSMutableString *equation;
@property NSMutableArray *values;
@property NSMutableArray *signs;

@end

@implementation CALCViewController

- (void)viewDidLoad
{
    self.currentVal = [NSMutableString stringWithString:@""];
    self.equation = [NSMutableString stringWithString:@""];
    self.values = [NSMutableArray array];
    self.signs = [NSMutableArray array];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)CEbutton:(id)sender {
    self.currentVal = [NSMutableString stringWithString:@""];
    self.equation = [NSMutableString stringWithString:@""];
    self.values = [NSMutableArray array];
    self.signs = [NSMutableArray array];
    self.textField.text = @"0";
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);

}

- (IBAction)DELbutton:(id)sender {
    if (![self.equation isEqualToString:@""]){
        if (![self.currentVal isEqualToString:@""]){
            NSRange range = NSMakeRange([self.currentVal length]-1,1);
            [self.currentVal replaceCharactersInRange:range withString:@""];
        }
        else {
            [self.signs removeLastObject];
            self.currentVal = [self.values objectAtIndex:[self.values count] - 1];
            [self.values removeLastObject];
        }
        NSRange erange = NSMakeRange([self.equation length]-1,1);
        [self.equation replaceCharactersInRange:erange withString:@""];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);
}

- (IBAction)SIGNbutton:(id)sender {
//    NSRange match;
//    match = [self.currentVal rangeOfString: @"-"];
//    if (match.location == NSNotFound) {
    if ([self.currentVal isEqualToString:@""]) {
        [self.currentVal appendString: @"-"];
        [self.equation appendString: @"-"];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)DIVbutton:(id)sender {
    if (![self.currentVal isEqualToString:@""]) {
        [self.equation appendString: @"÷"];
        [self.values addObject:self.currentVal];
        [self.signs addObject:@"÷"];        
        self.currentVal = [NSMutableString stringWithString:@""];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);
}

- (IBAction)MULbutton:(id)sender {
    if (![self.currentVal isEqualToString:@""]) {
        [self.equation appendString: @"*"];
        [self.values addObject:self.currentVal];
        [self.signs addObject:@"*"];
        self.currentVal = [NSMutableString stringWithString:@""];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);
}

- (IBAction)ADDbutton:(id)sender {
    if (![self.currentVal isEqualToString:@""]) {
        [self.equation appendString: @"+"];
        [self.values addObject:self.currentVal];
        [self.signs addObject:@"+"];
        self.currentVal = [NSMutableString stringWithString:@""];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);
}

- (IBAction)SUBbutton:(id)sender {
    if (![self.currentVal isEqualToString:@""]) {
        [self.equation appendString: @"–"];
        [self.values addObject:self.currentVal];
        [self.signs addObject:@"–"];
        self.currentVal = [NSMutableString stringWithString:@""];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);
}

- (IBAction)EQUbutton:(id)sender {
    //Need to take care of invalid input
    if (![self.currentVal isEqualToString:@""]) {
        [self.values addObject:self.currentVal];
        while ([self.signs count] > 0) {
            int position = 0;
            NSString *max = [self.signs objectAtIndex: 0];
            NSLog(@"Position: %d", position);
            NSLog(@"Max: %@", max);
            if ([self.signs count] > 1) {
                for(int i=1; i<[self.signs count] && (![max isEqualToString:@"*"] || ![max isEqualToString:@"÷"]); i++) {
                    NSString *current = [self.signs objectAtIndex: i];
                    if ([current isEqualToString:@"*"] || [current isEqualToString:@"÷"]) {
                        max = current;
                        position = i;
                    }
                }
            }
            NSLog(@"Position: %d", position);
            NSLog(@"Max: %@", max);
            float value = 0;
            if ([max isEqualToString:@"+"]) {
                value = [[self.values objectAtIndex: position] floatValue] + [[self.values objectAtIndex: position + 1] floatValue];
            } else if ([max isEqualToString:@"–"]) {
                value = [[self.values objectAtIndex: position] floatValue] - [[self.values objectAtIndex: position + 1] floatValue];
            } else if ([max isEqualToString:@"*"]) {
                value = [[self.values objectAtIndex: position] floatValue] * [[self.values objectAtIndex: position + 1] floatValue];
            } else {
                value = [[self.values objectAtIndex: position] floatValue] / [[self.values objectAtIndex: position + 1] floatValue];
            }
            NSLog(@"Total Value: %f",value);
            NSLog(@"1st Val: %f", [[self.values objectAtIndex: position] floatValue]);
            NSLog(@"2nd Val: %f", [[self.values objectAtIndex: position + 1] floatValue]);
            [self.values replaceObjectAtIndex:position withObject:[NSString stringWithFormat:@"%f",value]];
            [self.values removeObjectAtIndex:position+1];
            [self.signs removeObjectAtIndex:position];
        }
        self.currentVal = [NSMutableString stringWithString:[self.values objectAtIndex: 0]];
        self.equation = [NSMutableString stringWithString:[self.values objectAtIndex: 0]];
        self.values = [NSMutableArray array];
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
    NSLog (@"Signs count = %d", [self.signs count]);
    NSLog (@"Values count = %d", [self.values count]);
}

- (IBAction)DEVbutton:(id)sender {
    NSRange match;
    match = [self.currentVal rangeOfString: @"."];
    if (match.location == NSNotFound) {
        if ([self.currentVal isEqualToString:@""]) {
            [self.currentVal appendString: @"0."];
            [self.equation appendString: @"0."];
        }
        else {
            [self.currentVal appendString: @"."];
            [self.equation appendString: @"."];
        }
        self.textField.text = self.equation;
    }
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)zeroButton:(id)sender {
    [self.currentVal appendString: @"0"];
    [self.equation appendString: @"0"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)oneButton:(id)sender {
    [self.currentVal appendString: @"1"];
    [self.equation appendString: @"1"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)twoButton:(id)sender {
    [self.currentVal appendString: @"2"];
    [self.equation appendString: @"2"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)threeButton:(id)sender {
    [self.currentVal appendString: @"3"];
    [self.equation appendString: @"3"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)fourButton:(id)sender {
    [self.currentVal appendString: @"4"];
    [self.equation appendString: @"4"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)fiveButton:(id)sender {
    [self.currentVal appendString: @"5"];
    [self.equation appendString: @"5"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)sixButton:(id)sender {
    [self.currentVal appendString: @"6"];
    [self.equation appendString: @"6"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)sevenButton:(id)sender {
    [self.currentVal appendString: @"7"];
    [self.equation appendString: @"7"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)eightButton:(id)sender {
    [self.currentVal appendString: @"8"];
    [self.equation appendString: @"8"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}

- (IBAction)nineButton:(id)sender {
    [self.currentVal appendString: @"9"];
    [self.equation appendString: @"9"];
    self.textField.text = self.equation;
    NSLog (@"CurrentVal = %@", self.currentVal);
    NSLog (@"Equation = %@", self.equation);
}
@end
