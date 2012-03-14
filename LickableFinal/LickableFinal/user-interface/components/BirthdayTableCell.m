//
//  BirthdayTableCell.m
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import "BirthdayTableCell.h"
#import "Birthday.h"
#import "StyleSheet.h"

@implementation BirthdayTableCell

@synthesize birthday = _birthday;

@synthesize iconView = _iconView;
@synthesize nameLabel = _nameLabel;
@synthesize birthdayLabel = _birthdayLabel;
@synthesize remainingDaysLabel = _remainingDaysLabel;
@synthesize remainingDaysSubTextLabel = _remainingDaysSubTextLabel;
@synthesize remainingDaysImageView = _remainingDaysImageView;


-(void) setBirthday:(Birthday *)birthday
{
    _birthday = birthday;
    self.nameLabel.text = _birthday.name;
        
    int days = _birthday.remainingDaysUntilNextBirthday;
        
    if (days == 0) {
        //Birthday is today!
        self.remainingDaysLabel.text = self.remainingDaysSubTextLabel.text = @"";
        self.remainingDaysImageView.image = [UIImage imageNamed:@"icon-birthday-cake.png"];
    }
    else {
        self.remainingDaysLabel.text = [NSString stringWithFormat:@"%d",days];
        self.remainingDaysSubTextLabel.text = (days == 1) ? @"more day" : @"more days";
        self.remainingDaysImageView.image = [UIImage imageNamed:@"icon-days-remaining.png"];
    }
        
    self.birthdayLabel.text = _birthday.birthdayToDisplay;
    self.iconView.image = [UIImage imageNamed:_birthday.pic];
    
}

-(void) setIconView:(UIImageView *)iconView
{
    _iconView = iconView;
    if (_iconView) {
        [StyleSheet styleImageView:_iconView withType:ImageViewTypeTableCell];
    }
}

-(void) setNameLabel:(UILabel *)nameLabel
{
    _nameLabel = nameLabel;
    if (_nameLabel) {
        [StyleSheet styleLabel:_nameLabel withType:LabelTypeName];
    }
}

-(void) setBirthdayLabel:(UILabel *)birthdayLabel
{
    _birthdayLabel = birthdayLabel;
    if (_birthdayLabel) {
        [StyleSheet styleLabel:_birthdayLabel withType:LabelTypeBirthdayDate];
    }
}


-(void) setRemainingDaysLabel:(UILabel *)remainingDaysLabel
{
    _remainingDaysLabel = remainingDaysLabel;
    if (_remainingDaysLabel) {
        [StyleSheet styleLabel:_remainingDaysLabel withType:LabelTypeDaysUntilBirthday];
    }
}

-(void) setRemainingDaysSubTextLabel:(UILabel *)remainingDaysSubTextLabel
{
    _remainingDaysSubTextLabel = remainingDaysSubTextLabel;
    if (_remainingDaysSubTextLabel) {
        [StyleSheet styleLabel:_remainingDaysSubTextLabel withType:LabelTypeDaysUntilBirthdaySubText];
    }
}

@end
