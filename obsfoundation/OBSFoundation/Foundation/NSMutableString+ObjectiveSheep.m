/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 15/01/2012 
 *
 * ****************************************************************/

#import "NSMutableString+ObjectiveSheep.h"

@implementation NSMutableString (ObjectiveSheep)

- (void) replaceString: (NSString *) stringToBeReplaced withString: (NSString *)  replacement 
{
	NSRange substr = [self rangeOfString:stringToBeReplaced];
	while (substr.location != NSNotFound) 
	{
		[self replaceCharactersInRange:substr withString:replacement];
		substr = [self rangeOfString:stringToBeReplaced];
	}
}
@end
