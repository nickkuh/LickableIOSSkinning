//
//  BRData.m
//  BirthdayReminder
//
//  Created by Nick Kuh on 18/01/2012.
//  Copyright (c) 2012 App School. All rights reserved.
//

#import "Model.h"
#import "Birthday.h"

@implementation Model

@synthesize birthdays = _birthdays;

-(NSArray *) birthdays {
    
    if (_birthdays == nil) {
        
        
        
        NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"birthdays" ofType:@"plist"];
        NSArray *arrayOfDictionaries = [NSArray arrayWithContentsOfFile:plistPath];
        
        NSMutableArray *arrayOfBirthdays = [NSMutableArray array];
        
        int i;
        int max = [arrayOfDictionaries count];
        
        NSDictionary *dict;
        Birthday *birthday;
        
        for (i=0;i<max;i++) 
        {
            dict = [arrayOfDictionaries objectAtIndex:i];
            birthday = [[Birthday alloc] initWithDictionary:dict];
            [arrayOfBirthdays addObject:birthday];
        }
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"nextBirthday" ascending:YES];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        [arrayOfBirthdays sortUsingDescriptors:sortDescriptors];
        
        _birthdays = [NSArray arrayWithArray:arrayOfBirthdays];
    }
    
    return _birthdays;
}

@end
