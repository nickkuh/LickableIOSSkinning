//
//  HomeViewController.h
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import "CoreViewController.h"

@interface HomeViewController : CoreViewController <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
