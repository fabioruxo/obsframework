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
    NSRect newFrame = NSMakeRect(0, 0, 200, 150);
//    double imageWidth = [[self image] size].width;
//
//    // Old images get nicely resized instead of stretched...
//    if (imageWidth < 200)
//    {
//        newFrame.size.width = imageWidth;
//        newFrame.origin.x = frame.origin.x + 25;
//    }
    
    [[NSColor grayColor] set];
    [NSBezierPath setDefaultLineWidth:3.0];
    
    [super drawRect:newFrame];
    [NSBezierPath strokeRect:newFrame];
}

@end
