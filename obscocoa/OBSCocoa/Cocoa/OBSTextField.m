/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 14/04/2011 
 *
 * ****************************************************************/

#import "OBSTextField.h"

@implementation OBSTextField 

-(void) awakeFromNib
{
    [self setDelegate:self];
    [[self cell] setWraps:YES];}

- (BOOL)control:(NSControl *)control textShouldBeginEditing:(NSText *)fieldEditor
{
    [fieldEditor setFieldEditor:NO]; // This is used to allow return and tab to be used in the textview
    return YES;
}

- (void)controlTextDidChange:(NSNotification *)aNotification;
{
//    [self resizeTextField];
}

//This implements the live resizing
- (void)resizeTextField;
{
    NSRect oldFrame = [self frame];
    NSSize cellSize= [[self cell] cellSizeForBounds:[self bounds]];
    DLog(@"%f", cellSize.height);
    [self setFrame:NSMakeRect(oldFrame.origin.x, oldFrame.origin.y + oldFrame.size.height - cellSize.height, oldFrame.size.width, cellSize.height)];
}

-(NSSize)intrinsicContentSize
{
    if ( ![self.cell wraps] ) {
        return [super intrinsicContentSize];
    }
    
    NSRect frame = [self frame];
    
    CGFloat width = frame.size.width;
    
    // Make the frame very high, while keeping the width
    frame.size.height = CGFLOAT_MAX;
    
    // Calculate new height within the frame
    // with practically infinite height.
    CGFloat height = [self.cell cellSizeForBounds: frame].height;
    
    return NSMakeSize(width, height);
}

@end
