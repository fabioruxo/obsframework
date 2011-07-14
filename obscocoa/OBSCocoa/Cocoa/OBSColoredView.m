/* *****************************************************************
 *                           Pins        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 24/03/2010 
 *
 * ****************************************************************/

#import "OBSColoredView.h"

#define START_COLOR_GRADIENT		[NSColor colorWithCalibratedWhite:0.75 alpha:1.0]
#define END_COLOR_GRADIENT          [NSColor colorWithCalibratedWhite:0.90 alpha:1.0]

@implementation OBSColoredView
@synthesize color;

-(void) awakeFromNib
{
    if (IsEmpty(self.color)) self.color = @"azure";
}

- (void)drawRect:(NSRect)rect 
{
    [super drawRect:rect];
    
    BOOL fillRect = YES;
    if ([self.color isEqualToString:@"azure"])
    {
        [[NSColor colorWithCalibratedRed:0.845 green:0.865 blue:0.896 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"lightGray"])
    {
        [[NSColor colorWithCalibratedWhite:0.902 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"gray"])
    {
        [[NSColor colorWithCalibratedWhite:0.671 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"darkGray"])
    {
         [[NSColor colorWithCalibratedRed:0.160 green:0.174 blue:0.174 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"black"])
    {
        [[NSColor colorWithCalibratedRed:0.115 green:0.126 blue:0.126 alpha:0.98] set];
    }
    else if ([self.color isEqualToString:@"transparent"])
    {
        [[NSColor clearColor] set];
        fillRect = NO;
    }
    else if ([self.color isEqualToString:@"gradient"])
    {
        NSGradient *gradient = [[[NSGradient alloc] initWithStartingColor:START_COLOR_GRADIENT 
                                                              endingColor:END_COLOR_GRADIENT] autorelease];
        [gradient drawInRect:[self bounds] angle:90.0];

        NSRect lineRect = [self bounds];
        lineRect.size.height = 1;
        [[NSColor grayColor] set];
        NSRectFill(lineRect);
        
        fillRect = NO;
    }
    if (fillRect) NSRectFill(rect);
}

- (void) finalize
{
    color = nil;
    [super finalize];
}

@end
