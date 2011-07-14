/* *****************************************************************
 *                         ObjectiveSheep Framework       
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 18/03/2010.
 *
 * ****************************************************************/
#import <Foundation/Foundation.h>
#import "OBSTaskOutputReader.h"

@interface OBSTask : NSObject 
{
	NSString *output;
	NSString *error;
	NSTask *task;
}

@property (readonly) NSString *output;
@property (readonly) NSString *error;

- (void) prepareTask;

- (void) executeTask: (NSString *) processPath withArguments:(NSArray *) args;

- (void) executeTask: (NSString *) processPath withArguments:(NSArray *) args andTimeoutSeconds:(int) seconds;

@end
