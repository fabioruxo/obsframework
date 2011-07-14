/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 11/11/2010 
 *
 * ****************************************************************/

#import "NSTextView+ObjectiveSheep.h"

@implementation NSTextView(ObjectiveSheep)

- (void) insertText: (NSString*) aText color: (NSColor*) aColor
{ 
	[self insertText: aText]; 
	[self setTextColor: aColor];
} 

@end
