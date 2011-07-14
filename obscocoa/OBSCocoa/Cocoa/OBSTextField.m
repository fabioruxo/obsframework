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
    [[self cell] setWraps:YES];
}

- (BOOL)control:(NSControl *)control textShouldBeginEditing:(NSText *)fieldEditor
{
    [fieldEditor setFieldEditor:NO]; // This is used to allow return and tab to be used in the textview
    return YES;
}

- (void)controlTextDidChange:(NSNotification *)aNotification;
{
    //[self resizeTextField];
}

//This implements the live resizing
- (void)resizeTextField;
{
    NSRect oldFrame = [self frame];
    NSSize cellSize= [[self cell] cellSizeForBounds:[self bounds]];
    [self setFrame:NSMakeRect(oldFrame.origin.x, oldFrame.origin.y + oldFrame.size.height - cellSize.height, oldFrame.size.width, cellSize.height)];
}
@end
