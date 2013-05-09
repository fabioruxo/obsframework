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

#import "OBSTaskOutputReader.h"

@interface OBSTaskOutputReader(PrivateMethods)
@end

@implementation OBSTaskOutputReader

@synthesize timeoutSeconds;

- (id)initWithTask:(NSTask *)aTask
{
	self = [super init];
	if (IsEmpty(self)) return nil;
	
	task = aTask;
	standardOutput = [[NSMutableData alloc] init];
	standardError = [[NSMutableData alloc] init];
	timeoutSeconds = 0;
	
	NSFileHandle *standardOutputFile = [[aTask standardOutput] fileHandleForReading];
	NSFileHandle *standardErrorFile = [[aTask standardError] fileHandleForReading];
	
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(standardOutNotification:)
	 name:NSFileHandleDataAvailableNotification
	 object:standardOutputFile];
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(standardErrorNotification:)
	 name:NSFileHandleDataAvailableNotification
	 object:standardErrorFile];
	[[NSNotificationCenter defaultCenter]
	 addObserver:self
	 selector:@selector(terminatedNotification:)
	 name:NSTaskDidTerminateNotification
	 object:aTask];
	
	[standardOutputFile waitForDataInBackgroundAndNotify];
	[standardErrorFile waitForDataInBackgroundAndNotify];
	return self;
}

- (void) setInput:(NSString*) aString
{
	NSPipe *inputPipe = [NSPipe pipe]; 
	taskInput = [inputPipe fileHandleForWriting];
	NSString *dataString = @"ciao";
	[taskInput writeData:[dataString dataUsingEncoding: [NSString defaultCStringEncoding]]];
}

- (NSData *)standardOutputData
{
	return standardOutput;
}

- (NSData *)standardErrorData
{
	return standardError;
}

-(void)standardOutNotification: (NSNotification *) notification
{
	NSFileHandle *standardOutFile = (NSFileHandle *)[notification object];
	
	NSData *availableData = [standardOutFile availableData];
	if ([availableData length] == 0)
	{
		outputClosed = YES;
		return;
	}
	
	[standardOutput appendData:availableData];
	[standardOutFile waitForDataInBackgroundAndNotify];
}

-(void)standardErrorNotification: (NSNotification *) notification
{
	NSFileHandle *standardErrorFile = (NSFileHandle *)[notification object];
	
	NSData *availableData = [standardErrorFile availableData];
	if ([availableData length] == 0)
	{
		errorClosed = YES;
		return;
	}
	
	[standardError appendData:availableData];
	[standardErrorFile waitForDataInBackgroundAndNotify];
}

- (void)terminatedNotification: (NSNotification *)notification
{
	taskComplete = YES;
}

- (void) launchTaskAndRunSynchronous
{
	[task launch];
	
	BOOL isRunning = YES;
	NSDate *loopUntil;
	
	if (timeoutSeconds > 0)
	{
		loopUntil = [NSDate dateWithTimeIntervalSinceNow:timeoutSeconds];
	}
	else
	{
		loopUntil = [NSDate distantFuture];
	}
	
	while (isRunning && (!taskComplete || !outputClosed || !errorClosed))
	{
		isRunning =
		[[NSRunLoop currentRunLoop]
		 runMode:NSDefaultRunLoopMode
		 beforeDate:loopUntil];
	}
}

- (void) launchTask
{
    [task launch];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

