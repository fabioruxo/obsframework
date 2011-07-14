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


@implementation Notifier

- (id) init
{
	self = [super init];
    [[NSNotificationCenter defaultCenter] 
     postNotificationName:@"GFNotification" object:nil];
	return self;
}

- (NSString*) description
{
    return @"Notifier object";
}
@end
