//
//  BRDBirthday.h
//  BirthdayReminder
//
//  Created by Nick Kuh on 18/01/2012.
//  Copyright (c) 2012 App School. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Birthday : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *uid;
@property (nonatomic,strong) NSString *pic;
@property (nonatomic,strong) NSDate *nextBirthday;

@property (nonatomic) int birthDay;
@property (nonatomic) int birthMonth;
@property (nonatomic) int birthYear;
@property (nonatomic) int nextBirthdayAge;

@property (nonatomic,readonly) UIImage *image;
@property (nonatomic,readonly) int remainingDaysUntilNextBirthday;
@property (nonatomic,readonly) NSString *birthdayToDisplay;


-(id) initWithDictionary:(NSDictionary *)dicationary;

-(void)updateNextBirthdayAndAge;

@end
