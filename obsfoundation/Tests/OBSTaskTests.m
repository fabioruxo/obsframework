/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 18/03/2010.
 *
 * ****************************************************************/
#import <SenTestingKit/SenTestingKit.h>
#import "ObjectiveSheep.h"

@interface OBSTaskTests : SenTestCase 
@end

@implementation OBSTaskTests

/**
 * Tests the executeTask method
 */
- (void) testTask
{
	OBSTask *task = [[[OBSTask alloc] init] autorelease];
	NSArray *args = [[[NSArray alloc] init] autorelease];
	[task executeTask:@"/bin/ls" withArguments:args];
	STAssertTrue([task.output length] > 0, @"Could not execute ls command. Task test fails.");
}

/**
 * Tests the task with an error expected
 */
- (void) testTaskWithError
{
	OBSTask *task = [[[OBSTask alloc] init] autorelease];
	NSArray *args = [NSArray arrayWithObject:@"ffffffaaafffffaaaffffaa"];
	[task executeTask:@"/bin/ls" withArguments:args];
	STAssertTrue([task.output length] == 0, @"I expected an error. Is this just output?");
	STAssertTrue([task.error length] > 0, @"I expected an error. Is this just output?");
}

@end
