/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 04/05/2011 
 *
 * ****************************************************************/
#import "OBSLinkLabel.h"

@implementation OBSLinkLabel

@synthesize url;

- (void) awakeFromNib
{
   if (IsEmpty(url)) url = @"http://objectivesheep.com";
    [self addCursorRect:[self bounds] cursor:[NSCursor dragLinkCursor]];
}

-(void) mouseDown:(NSEvent *) theEvent 
{    
    [super mouseDown:theEvent];
    [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:url]];
}

- (void) finalize
{
    url = nil;
    [super finalize];
}
@end
