//
//  dropDownMenu.h
//  dropDownMenu
//
//  Created by Jason Becht on 2/15/14.
//  Copyright (c) 2014 RazorWire Solutions, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class dropDownMenu;

@protocol dropDownMenu <NSObject>
@required

- (void)selectionReturned: (NSString *)selectedItem;

@end

@interface dropDownMenu : UIView <UITableViewDataSource, UITableViewDelegate> {
    UITableView *menuTableView;
    NSArray *menuItems;
}

@property (nonatomic, assign) id delegate;

@property (nonatomic, strong) NSString *selection;

- (UIView *)showMenu:(NSArray *)items atPosition:(CGRect)pos;

@end
