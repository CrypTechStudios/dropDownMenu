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
    // create a pointer to a dropDownMenu object
    dropDownMenu *thisMenu;
}
@synthesize menuSelectedText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib..
    // set padding for text in text field
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 20)];
    menuSelectedText.leftView = paddingView;
    menuSelectedText.leftViewMode = UITextFieldViewModeAlways;
    
    thisMenu = [[dropDownMenu alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMenu:(id)sender {
    NSArray *menuItems = [[NSArray alloc] initWithObjects:@"one",@"two",@"three",@"four",@"five", nil];

    // set the name for your menu
    NSString *menuName = @"clickMe";
    [self.view addSubview:[thisMenu showMenu:menuName withItems:menuItems atPosition:self.menuSelectedText.frame]];
    
    // add observer for receiving the selected menu item string
    [[NSNotificationCenter defaultCenter] addObserverForName:menuName object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
        // do what you will with the returned selected menu item string
        self.menuSelectedText.text = thisMenu.selection;
    }];
    
}

@end

