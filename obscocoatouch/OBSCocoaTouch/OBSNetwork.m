//
//  OBSNetwork.m
//  Workhorse
//
//  Created by Fabio on 27/11/13.
//  Copyright (c) 2013 Workhorse. All rights reserved.
//

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
    Reachability* reach = [Reachability reachabilityWithHostname:@"www.google.com"];
    reach.reachableOnWWAN = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(reachabilityChanged:)
                                                 name:kReachabilityChangedNotification
                                               object:nil];
    [reach startNotifier];
}

- (BOOL) isNetworkAvailable:(BOOL)showAlert
{
    [self checkNetwork];
    if (sharedSingleton.networkStatus == NotReachable)
    {
        if (showAlert)[sharedSingleton showNetworkUnavailableAlert];
        return NO;
    }
    else return YES;
}

- (void) reachabilityChanged:(NSNotification*)notification
{
    Reachability* r = [notification object];
	sharedSingleton.networkStatus = r.currentReachabilityStatus;
}

- (void) showNetworkUnavailableAlert
{
    if (sharedSingleton.networkStatus == NotReachable)
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
