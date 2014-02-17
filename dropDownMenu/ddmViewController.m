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
    thisMenu.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showMenu:(id)sender {
    NSArray *menuItems = [[NSArray alloc] initWithObjects:@"one",@"two",@"three",@"four",@"five", nil];

    // set the name for your menu
    [self.view addSubview:[thisMenu showMenu:menuItems atPosition:self.menuSelectedText.frame]];
}

- (void)selectionReturned:(NSString *)selectedItem {
    self.menuSelectedText.text = selectedItem;
}

@end

