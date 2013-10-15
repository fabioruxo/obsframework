/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 05/05/2011 
 *
 * ****************************************************************/

#import "OBSTextureView.h"

@implementation OBSTextureView

- (void)drawRect:(NSRect)rect 
{
    float xOffset = NSMinX([self convertRect:[self frame] toView:nil]);
    float yOffset = NSMaxY([self convertRect:[self frame] toView:nil]);
    [[NSGraphicsContext currentContext] setPatternPhase:NSMakePoint(xOffset, yOffset)];
    [[NSColor colorWithPatternImage:[NSImage imageNamed:@"page_background.png"]] set];
    [NSBezierPath fillRect:rect];
    [[NSColor grayColor] set];
    [NSBezierPath strokeRect:rect];
}

@end
