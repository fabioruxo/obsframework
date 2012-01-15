/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 25/01/2010
 *
 * ****************************************************************/

#import <SenTestingKit/SenTestingKit.h>
#import "ObjectiveSheep.h"

@interface OBSStringTests : SenTestCase
@end

@implementation OBSStringTests

/**
 * Tests the reverse method
 */
- (void) testReverse
{
//	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//	NSString *str  = [NSString stringWithString:@"ciao"];
//	NSString *rev;
//	NSLog(@"Bla la bla");
//	rev = [str reverse];
//	
//	NSLog(@" -> Reversed: %@",rev); 
//	STAssertEqualObjects(rev,@"oaic", @"Expected oaic but was %@", rev);
//    NSLog(@"str retain count: %i", [rev retainCount]);
//	[pool drain];
}

/**
 * Tests the concatenate method
 */
-(void) testConcatenate
{
//	NSString * space = @" ";
//	NSString * str  = [NSString concatenate:@"ciao", space , @"ciao"];
//	NSLog(@" -> After append: %@", str);
//	STAssertEqualObjects(str,@"ciao ciao", @"Expected ciao ciao but was %@", str);
}

/**
 * Tests the contains method
 */
-(void) testContains 
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSString * ref = @"aaa 123 bbb";
	
	STAssertTrue([ref contains:@"123"], @"String does not contain 123!");
	STAssertTrue([ref contains:@" "], @"String does not contain white space!");
	STAssertFalse([ref contains:@"456"], @"This one should have failed");
	[pool drain];
}

/**
 * Tests the contains method
 */
-(void) testReplace
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSString * ref = @"aaa 123 bbb";
	
	NSString * str  = [ref stringByReplacingString:@"123" withString:@"456"];
	NSLog(@" -> After replacement: %@", str);
	
	STAssertEqualObjects(str, @"aaa 456 bbb", @"Expected aaa 456 bbb but was %@", str);
	
	[pool drain];
}

/**
 * Tests the contains method
 */
-(void) testMutableReplace
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSMutableString * ref = [[NSMutableString alloc] initWithString:@"aaa 123 bbb"];
	
	[ref replaceString:@"123" withString:@"456"];
	NSLog(@" -> After replacement: %@", ref);
	
	STAssertEqualObjects(ref, @"aaa 456 bbb", @"Expected aaa 456 bbb but was %@", ref);
	
	[pool drain];
}

/**
 * Tests the contains method
 */

-(void) testLastIndexOf
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSString * ref;
		
	ref = @"bla.bla3.bla3";
	NSRange r = [ref lastIndexOf:@"." inString:ref];
	NSLog(@"Range is: %d, %d", r.length, r.location);
	STAssertTrue( r.length > 0 , @"No match for lastIndexOf");
		
	[pool drain];
}

/**
 * Extensively tests regular expression matches along with a set of
 * premade regular expressions in a common header
 */
-(void) testMatchesRegex
{
	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	NSString * ref;
	
	ref = @"abc123";
	STAssertTrue([ref matches: ALPHANUMERIC], @"No match for ALPHANUMERIC");

	ref = @"abc123!!";
	STAssertFalse([ref matches: ALPHANUMERIC], @"Should Not match ALPHANUMERIC");
	
	ref = @"a";
	STAssertTrue([ref matches: CHAR], @"No match for CHAR");
	
	ref = @"aa";
	STAssertTrue([ref matches: TWOCHARS], @"No match for TWOCHARS");

	ref = @"0";
	STAssertTrue([ref matches: NUMBER], @"No match for NUMBER");

	ref = @"0a";
	STAssertFalse([ref matches: NUMBER], @"Should Not match NUMBER");

	ref = @"7";
	STAssertTrue([ref matches: DIGIT], @"No match for DIGIT");

	ref = @"77";
	STAssertFalse([ref matches: DIGIT], @"Should Not match DIGIT");
	
	ref = @"10";
	STAssertTrue([ref matches: POSITIVENUMBER], @"No match for POSITIVENUMBER");
	
	ref = @"12,33";
	STAssertTrue([ref matches: DECIMALNUMBER], @"No match for DECIMALNUMBER");
	
	ref = @"fabio@objectivesheep.com";
	STAssertTrue([ref matches: EMAIL], @"No match for EMAIL");

	ref = @"fabio-objectivesheep.com";
	STAssertFalse([ref matches: EMAIL], @"Should Not match EMAIL");
	
	[pool drain];
}

@end
