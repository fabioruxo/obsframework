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

#import <Foundation/Foundation.h>
#import "Reachability.h"

/*
 Assumes you have intalled the Reachability pod!
 From anywhere in your code just:
 
   [OBSNetwork sharedInstance] checkNetwork];
 
 and you're up and running!
 */
@interface OBSNetwork : NSObject

@property (readwrite) NetworkStatus networkStatus;

+ (OBSNetwork *)sharedInstance;
- (BOOL) isNetworkAvailableWithAlert:(BOOL)showAlert;
- (BOOL) isNetworkUnavailableWithAlert:(BOOL)showAlert;
@end
