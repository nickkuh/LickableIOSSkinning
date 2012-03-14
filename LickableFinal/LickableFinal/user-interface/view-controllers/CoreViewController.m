//
//  CoreViewController.m
//  LickableFinal
//
//  Created by Nick Kuh on 14/03/2012.
//  Copyright (c) 2012 Osmosis Digital Limited. All rights reserved.
//

#import "CoreViewController.h"

@implementation CoreViewController

-(void) viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor blackColor];
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app-background.png"]];
    [self.view insertSubview:backgroundView atIndex:0];

}


@end
