/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 9/08/2010 
 *
 * ****************************************************************/
#import "Notifier.h"
#import "Notified.h"

#import <SenTestingKit/SenTestingKit.h>
#import "ObjectiveSheep.h"

@interface NotificationsTest : SenTestCase 
{
    BOOL _isDone;
}
@end

@implementation NotificationsTest

- (void) setUp
{
    _isDone = NO;
}

- (void) testSimpleNotification
{
    [NSRunLoop currentRunLoop];
    
	Notified *nf = [[Notified alloc] init];
    Notifier *hw = [[Notifier alloc] init];
    
	NSLog(@"Notifier object: %@", hw);
	
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(testSimpleNotificationDone:) name:@"doneTesting" object:self];
    [[NSNotificationQueue defaultQueue] enqueueNotification:
     [NSNotification notificationWithName:@"doneTesting" object:self]
                                               postingStyle:NSPostWhenIdle];
    
    while (!_isDone)
    {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate
                                                  dateWithTimeIntervalSinceNow:1.0]];
        NSLog(@"Polling...");
    }
	STAssertTrue(nf.hasReceived, @"The notification could not be received!");
}

- (void) testSimpleNotificationDone:(NSNotification*)notification;
{
    _isDone = YES;
}

@end