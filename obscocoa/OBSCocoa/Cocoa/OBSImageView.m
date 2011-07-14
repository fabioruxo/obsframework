/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 18/04/2011 
 *
 * ****************************************************************/

#import "OBSImageView.h"

@implementation OBSImageView

- (void)drawRect:(NSRect)frame 
{
    [[NSColor grayColor] set];
    [NSBezierPath setDefaultLineWidth:3.0];
    
    [super drawRect:frame];
    [NSBezierPath strokeRect:frame];
}

@end
