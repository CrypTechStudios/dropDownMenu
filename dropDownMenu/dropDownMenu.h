//
//  dropDownMenu.h
//  dropDownMenu
//
//  Created by Jason Becht on 2/15/14.
//  Copyright (c) 2014 RazorWire Solutions, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dropDownMenu : UIView <UITableViewDataSource, UITableViewDelegate> {
    UITableView *menuTableView;
    NSArray *menuItems;
}
@property (nonatomic, strong) NSString *selection;
@property (nonatomic, strong) NSString *menuName;

- (UIView *)showMenu:(NSString *)name withItems:(NSArray *)items atPosition:(CGRect)pos;

@end
