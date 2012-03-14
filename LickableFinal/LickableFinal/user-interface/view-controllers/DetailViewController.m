//
//  DetailViewController.m
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import "DetailViewController.h"
#import "Birthday.h"
#import "StyleSheet.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize birthday = _birthday;
@synthesize iconView = _iconView;
@synthesize birthdayLabel = _birthdayLabel;
@synthesize remainingDaysImageView = _remainingDaysImageView;
@synthesize remainingDaysLabel = _remainingDaysLabel;
@synthesize remainingDaysSubTextLabel = _remainingDaysSubTextLabel;
@synthesize callButton = _callButton;
@synthesize emailButton = _emailButton;
@synthesize deleteButton = _deleteButton;

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setBirthday:_birthday];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setIconView:nil];
    [self setBirthdayLabel:nil];
    [self setRemainingDaysImageView:nil];
    [self setRemainingDaysLabel:nil];
    [self setRemainingDaysSubTextLabel:nil];
    [self setCallButton:nil];
    [self setEmailButton:nil];
    [self setDeleteButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void) setBirthday:(Birthday *)birthday
{
    _birthday = birthday;
    
    self.title = self.birthday.name;
    
    self.birthdayLabel.text = [self.birthday birthdayToDisplay];
    int days = [self.birthday remainingDaysUntilNextBirthday];
    
    if (days == 0) {
        self.remainingDaysLabel.text = self.remainingDaysSubTextLabel.text = @"";
        self.remainingDaysImageView.image = [UIImage imageNamed:@"icon-birthday-cake.png"];
    }
    else {
        self.remainingDaysLabel.text = [NSString stringWithFormat:@"%d",days];
        self.remainingDaysSubTextLabel.text = (days == 1) ? @"more day" : [NSString stringWithFormat:@"more days",days];
        self.remainingDaysImageView.image = [UIImage imageNamed:@"icon-days-remaining.png"];
    }  
    
    self.iconView.image = [UIImage imageNamed:self.birthday.pic];

    [self.callButton setTitle:[NSString stringWithFormat:@"Call %@",self.birthday.name] forState:UIControlStateNormal];
    [self.emailButton setTitle:[NSString stringWithFormat:@"Email %@",self.birthday.name] forState:UIControlStateNormal];
    [self.deleteButton setTitle:[NSString stringWithFormat:@"Delete %@",self.birthday.name] forState:UIControlStateNormal];
}

-(void) setIconView:(UIImageView *)iconView
{
    _iconView = iconView;
    if (_iconView) {
        [StyleSheet styleImageView:_iconView withType:ImageViewTypeLarge];
    }
}

-(void) setBirthdayLabel:(UILabel *)birthdayLabel
{
    _birthdayLabel = birthdayLabel;
    if (_birthdayLabel) {
        [StyleSheet styleLabel:_birthdayLabel withType:LabelTypeName];
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
