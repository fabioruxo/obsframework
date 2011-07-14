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
#import "OBSTask.h"

@interface OBSTask(PrivateMethods)

@end

@implementation OBSTask

@synthesize output;
@synthesize error;

- (id) init
{
	self = [super init];
	if (self != nil)
	{	
		[self prepareTask];
	}
	return self;
}

- (void) prepareTask
{
	[task release];
	task = nil;
	task = [[NSTask alloc] init]; 
	[task setStandardOutput:[NSPipe pipe]];
	[task setStandardError:[NSPipe pipe]];
}

- (void) executeTask: (NSString *) processPath withArguments:(NSArray *) args
{
	[task setLaunchPath:processPath];
	[task setArguments:args];
	
	OBSTaskOutputReader *outputReader = [[OBSTaskOutputReader alloc] initWithTask:task];
	
	[outputReader launchTaskAndRunSynchronous];
	
	[output release];
	[error release];
	
	output = [[NSString alloc] initWithData:[outputReader standardOutputData] encoding:NSUTF8StringEncoding];
	error = [[NSString alloc] initWithData:[outputReader standardErrorData] encoding:NSUTF8StringEncoding];
	
	[outputReader release];
}

/*
 NSString* input = [NSString stringWithFormat: @"%@\n", s];
 NSFileHandle* fh = [[task standardInput] fileHandleForWriting];
 [fh writeData:[input dataUsingEncoding: NSMacOSRomanStringEncoding]];
 NSFileHandle* fh2 = [[task standardOutput] fileHandleForReading];
 NSString* output = [[[NSString alloc] initWithData: [fh2 availableData]
 encoding: NSUTF8StringEncoding] autorelease];
 */
- (void) executeTask: (NSString *) processPath withArguments:(NSArray *) args andTimeoutSeconds:(int) seconds
{	
	[task setLaunchPath:processPath];
	[task setArguments:args];

	
	OBSTaskOutputReader *outputReader = [[OBSTaskOutputReader alloc] initWithTask:task];
	
	[outputReader setTimeoutSeconds:seconds];
	[outputReader launchTaskAndRunSynchronous];
	
	[output release];
	[error release];
	
	output = [[NSString alloc] initWithData:[outputReader standardOutputData] encoding:NSUTF8StringEncoding];
	error = [[NSString alloc] initWithData:[outputReader standardErrorData] encoding:NSUTF8StringEncoding];
	
	[outputReader release];
}

- (void) dealloc
{
	[task release];
	[output release];
	[error release];
	[super dealloc];
}

@end
