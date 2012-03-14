//
//  BRDBirthday.m
//  BirthdayReminder
//
//  Created by Nick Kuh on 18/01/2012.
//  Copyright (c) 2012 App School. All rights reserved.
//

#import "Birthday.h"

@interface Birthday()

-(void)updateNextBirthdayAndAge;

@end

@implementation Birthday

static NSDateFormatter *dateFormatterPartial;

@synthesize name = _name;
@synthesize uid = _uid;
@synthesize pic = _pic;
@synthesize birthDay = _birthDay;
@synthesize birthMonth = _birthMonth;
@synthesize birthYear = _birthYear;
@synthesize nextBirthday = _nextBirthday;
@synthesize nextBirthdayAge = _nextBirthdayAge;

-(id) initWithDictionary:(NSDictionary *)dicationary
{
    self = [super init];
    if (self) {
        self.name = [dicationary objectForKey:@"name"];
        self.uid= [dicationary objectForKey:@"uid"];
        self.pic = [dicationary objectForKey:@"pic"];
        
        NSDate *birthDate = [dicationary objectForKey:@"birthdate"];
        NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:birthDate];
        
        self.birthDay = dateComponents.day;
        self.birthMonth = dateComponents.month;
        self.birthYear = dateComponents.year;

        [self updateNextBirthdayAndAge];
    }
    return self;
}

-(UIImage *) image
{
    if (!self.pic || self.pic.length == 0) return nil;
    return [UIImage imageNamed:self.pic];

}

-(void)updateNextBirthdayAndAge
{
    
    NSDate *now = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:now];
    NSDate *today = [calendar dateFromComponents:dateComponents];
    
    dateComponents.day = self.birthDay;
    dateComponents.month = self.birthMonth;
    
    NSDate *birthdayThisYear = [calendar dateFromComponents:dateComponents];
    
    if ([today compare:birthdayThisYear] == NSOrderedDescending) {
        //birthday this year has passed so next birthday will be next year
        dateComponents.year++;
        self.nextBirthday = [calendar dateFromComponents:dateComponents];
    }
    else {
        self.nextBirthday = birthdayThisYear;
    }
    
    if (self.birthYear > 0) {
        self.nextBirthdayAge =  dateComponents.year - self.birthYear;
    }
    else {
        self.nextBirthdayAge = 0;
    }
    

}

-(int) remainingDaysUntilNextBirthday {
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToday = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:now];
    NSDate *today = [calendar dateFromComponents:componentsToday];
    
    NSTimeInterval timeDiffSecs = [self.nextBirthday timeIntervalSinceDate:today];
    
    int days = floor(timeDiffSecs/(60.f*60.f*24.f));
    
    return days;        
    
}

-(NSString *) birthdayToDisplay {
    
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsToday = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:now];
    NSDate *today = [calendar dateFromComponents:componentsToday];
    
    NSDateComponents *components = [calendar components:NSMonthCalendarUnit|NSDayCalendarUnit
                                               fromDate:today
                                                 toDate:self.nextBirthday
                                                options:0];
    
    
    if (components.month == 0) {
        if (components.day == 0) {
            //today!
            
            if (self.nextBirthdayAge> 0) {
                return [NSString stringWithFormat:@"%d Today!",self.nextBirthdayAge];
            }
            else {
                return @"Today!";
            }
        }
        if (components.day == 1) {
            //tomorrow!
            if (self.nextBirthdayAge > 0) {
                return [NSString stringWithFormat:@"%d Tomorrow!",self.nextBirthdayAge];
            }
            else {
                return @"Tomorrow!";
            }
        }
    }
    
    
    
    NSString *text = @"";
    
    if (self.nextBirthdayAge > 0) {
        text = [NSString stringWithFormat:@"%d on ",self.nextBirthdayAge];
    }
    
    
    if (dateFormatterPartial == nil) {
        dateFormatterPartial = [[NSDateFormatter alloc] init];
        [dateFormatterPartial setDateFormat:@"MMM d"];
    }
    
    return [text stringByAppendingFormat:@"%@",[dateFormatterPartial stringFromDate:self.nextBirthday]];
}


@end
