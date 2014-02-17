//
//  ddmViewController.h
//  dropDownMenu
//
//  Created by Jason Becht on 2/15/14.
//  Copyright (c) 2014 RazorWire Solutions, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
// include the dropDownMenu class
#import "dropDownMenu.h"

@interface ddmViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *menuButton;
@property (strong, nonatomic) IBOutlet UITextField *menuSelectedText;

@end
