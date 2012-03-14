//
//  HomeViewController.m
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import "BirthdayTableCell.h"
#import "Model.h"
#import "Birthday.h"

@interface HomeViewController ()

@property (nonatomic, strong) Model *model;

@end

@implementation HomeViewController
@synthesize tableView = _tableView;
@synthesize model = _model;

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailViewController = segue.destinationViewController;
    detailViewController.birthday = [self.model.birthdays objectAtIndex:self.tableView.indexPathForSelectedRow.row];
}

-(Model *)model
{
    if (_model == nil) {
        _model = [[Model alloc] init];
    }
    
    return _model;
}


#pragma mark UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BirthdayTableCell *cell = (BirthdayTableCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.backgroundView = (indexPath.row == 0) ? [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table-row-background.png"]] : [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table-row-icing-background.png"]];
    
    Birthday *birthday = [self.model.birthdays objectAtIndex:indexPath.row];
    
    cell.birthday = birthday;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.model.birthdays count];
}



@end
