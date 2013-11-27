/* *****************************************************************
 *                         ObjectiveSheep Framework
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 27/11/2013
 *
 * ****************************************************************/

#import "OBSAPIClient.h"

@implementation OBSAPIClient

static OBSAPIClient *sharedSingleton;

+ (OBSAPIClient *) sharedInstance
{
	@synchronized(self)
	{
		if (!sharedSingleton) sharedSingleton = [[OBSAPIClient alloc] init];
	}
	return sharedSingleton;
}

/*
 Given the server updated_at (rails) and local updatedAt (NSDate) see if
 the local version should be overwritten with the incoming api version
 */
- (BOOL) shouldUpdateFromServerGivenRemoteDate:(NSDate*)updatedRemote andLocalDate:(NSDate*)updatedLocal
{
    NSDateFormatter * f = [[NSDateFormatter alloc] init];
    [f setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    f.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];
    f.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    f.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    if ([updatedLocal isEarlierThanDate:updatedRemote]) return YES;
    return NO;
}

@end
