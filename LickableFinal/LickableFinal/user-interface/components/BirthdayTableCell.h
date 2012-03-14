//
//  BirthdayTableCell.h
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Birthday;

@interface BirthdayTableCell : UITableViewCell

@property(nonatomic,strong) Birthday *birthday;

@property (nonatomic, weak) IBOutlet UIImageView* iconView;
@property (nonatomic, weak) IBOutlet UIImageView* remainingDaysImageView;

@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* birthdayLabel;
@property (nonatomic, weak) IBOutlet UILabel* remainingDaysLabel;
@property (nonatomic, weak) IBOutlet UILabel* remainingDaysSubTextLabel;

@end
