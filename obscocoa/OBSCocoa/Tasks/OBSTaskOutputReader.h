/* *****************************************************************
 *                         ObjectiveSheep Framework       
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 15/03/2010.
 *
 * ****************************************************************/
#import <Foundation/Foundation.h>
#import "OBSMacros.h"

@interface OBSTaskOutputReader :NSObject
{
	NSMutableData *standardOutput;
	NSMutableData *standardError;
	NSFileHandle *taskInput;

	BOOL taskComplete;
	BOOL outputClosed;
	BOOL errorClosed;
	NSTask *task;
	int timeoutSeconds;
}
@property (readwrite) int timeoutSeconds;

- (id) initWithTask:(NSTask *)aTask;
- (void) launchTask;
- (void) launchTaskAndRunSynchronous;
- (NSData *)standardOutputData;
- (NSData *)standardErrorData;
@end

