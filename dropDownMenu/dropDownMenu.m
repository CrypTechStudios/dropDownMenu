//
//  dropDownMenu.m
//  dropDownMenu
//
//  Created by Jason Becht on 2/15/14.
//  Copyright (c) 2014 RazorWire Solutions, Inc. All rights reserved.
//

#import "dropDownMenu.h"

@implementation dropDownMenu
@synthesize selection, menuName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (UIView *)showMenu:(NSString *)name withItems:(NSArray *)items atPosition:(CGRect)pos {
    menuName = name;
    menuItems = [[NSArray alloc] initWithArray:items];

    //set origin
    
    CGRect newFrame = pos;
    newFrame.size.height = [menuItems count] * 44;
    newFrame.size.width = (newFrame.size.width - 30);
//    newFrame.origin = CGPointMake(pos.x, pos.y);
    
    menuTableView = [[UITableView alloc] initWithFrame:newFrame style:UITableViewStylePlain];
    menuTableView.dataSource = self;
    menuTableView.delegate = self;
    [menuTableView.layer setBorderColor:[UIColor blackColor].CGColor];
    [menuTableView.layer setBorderWidth:1.0f];
    menuTableView.layer.cornerRadius = 8.0;
    [menuTableView setBackgroundColor:[UIColor grayColor]];
    return menuTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return [menuItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *CellIdentifier = @"dropDownMenuCell";
 
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault)
                                                   reuseIdentifier:@"cell"];
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.backgroundColor = [UIColor whiteColor];
    [cell.textLabel setText:[menuItems objectAtIndex:indexPath.row]];
    return cell;
}
- (void)tableView: (UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    selection = cell.textLabel.text;
    // post notification that zone updated
    [[NSNotificationCenter defaultCenter]
     postNotificationName:menuName
     object:self];

    [menuTableView removeFromSuperview];
    
    
}

@end
