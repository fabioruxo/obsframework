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
#import "Notified.h"


@implementation Notified
@synthesize hasReceived;

- (id) init
{
	self = [super init];
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(notificationArrived) 
                                                 name:@"GFNotification" object:nil]; 
	NSLog(@"Notified init...");
    return self;
}

-(void) notificationArrived
{
    NSLog(@"A notification has arrived ");
	hasReceived = YES;
}

@end
