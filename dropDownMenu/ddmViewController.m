//
//  ddmViewController.m
//  dropDownMenu
//
//  Created by Jason Becht on 2/15/14.
//  Copyright (c) 2014 RazorWire Solutions, Inc. All rights reserved.
//

#import "ddmViewController.h"

@interface ddmViewController ()

@end

@implementation ddmViewController {
    dropDownMenu *thisMenu;
}
@synthesize menuSelectedLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib..
    thisMenu = [[dropDownMenu alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMenu:(id)sender {
    NSArray *menuItems = [[NSArray alloc] initWithObjects:@"one",@"two",@"three",@"four",@"five", nil];

    [self.view addSubview:[thisMenu showMenu:@"clickMe" withItems:menuItems atPosition:self.menuButton.center]];
    
//    [self.view addSubview:[thisMenu showMenu:menuItems position:self.menuButton.center]];
    // add observer for zone updates to trigger control pad for zone 0
  
    
    [[NSNotificationCenter defaultCenter] addObserverForName:@"clickMe" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
        self.menuSelectedLabel.text = thisMenu.selection;
    }];
}

@end
