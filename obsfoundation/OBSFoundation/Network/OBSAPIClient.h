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
#import "NSDate+ObjectiveSheep.h"

@interface OBSAPIClient : NSObject

+ (OBSAPIClient *)sharedInstance;
- (BOOL) shouldUpdateFromServerGivenRemoteDate:(NSDate*)updatedRemote andLocalDate:(NSDate*)updatedLocal;

@end
