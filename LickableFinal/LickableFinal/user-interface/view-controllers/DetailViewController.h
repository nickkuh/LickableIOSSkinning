//
//  DetailViewController.h
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import "CoreViewController.h"

@class Birthday;

@interface DetailViewController : CoreViewController

@property (nonatomic, strong) Birthday *birthday;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *remainingDaysImageView;
@property (weak, nonatomic) IBOutlet UILabel *remainingDaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingDaysSubTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
