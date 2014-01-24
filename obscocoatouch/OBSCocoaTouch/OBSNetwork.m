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

#import "OBSNetwork.h"

@implementation OBSNetwork

static OBSNetwork *sharedSingleton;

+ (OBSNetwork *) sharedInstance
{
	@synchronized(self)
	{
		if (!sharedSingleton) sharedSingleton = [[OBSNetwork alloc] init];
        [sharedSingleton checkNetwork];
	}
	return sharedSingleton;
}

- (void) checkNetwork
{
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    self.networkStatus = [networkReachability currentReachabilityStatus];
}

- (BOOL) isNetworkUnavailableWithAlert:(BOOL)showAlert
{
    return ![self isNetworkAvailableWithAlert:showAlert];
}

- (BOOL) isNetworkAvailableWithAlert:(BOOL)showAlert
{
    [self checkNetwork];
    if (self.networkStatus != NotReachable) return YES;
    else
    {
        if (showAlert)[self showNetworkUnavailableAlert];
        return NO;
    }
}

//- (void) reachabilityChanged:(NSNotification*)notification
//{
//    Reachability* r = [notification object];
//    if (r.isReachableViaWWAN) self.networkStatus = ReachableViaWWAN;
//    else if (r.isReachableViaWiFi) self.networkStatus = ReachableViaWiFi;
//    else self.networkStatus = NotReachable;
//    DLog(@"self.networkStatus = %d", self.networkStatus);
//}

- (void) showNetworkUnavailableAlert
{
    if (self.networkStatus == NotReachable)
	{
		NSString* msg = @"Network unavailable; please try again later.";
		UIAlertView* av = [[UIAlertView alloc] initWithTitle:nil
                                                     message:msg
                                                    delegate:self
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles:nil];
        [av show];
	}
}

@end
