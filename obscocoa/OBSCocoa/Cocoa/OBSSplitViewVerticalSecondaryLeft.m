/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 24/03/2011 
 *
 * ****************************************************************/

#import "OBSSplitViewVerticalSecondaryLeft.h"

@implementation OBSSplitViewVerticalSecondaryLeft

@synthesize secondaryPaneMinSize;
@synthesize secondaryPaneMaxSize;

@synthesize collapsed;

- (void) awakeFromNib
{
    [self setDelegate:self];
    
    primaryViewIndex = 1;
    secondaryViewIndex = 0;

    if (IsEmpty(self.secondaryPaneMinSize)) self.secondaryPaneMinSize = [NSNumber numberWithFloat:MIN_SIZE_LEFT_PANE];
    if (IsEmpty(self.secondaryPaneMaxSize)) self.secondaryPaneMaxSize = [NSNumber numberWithFloat:MAX_SIZE_LEFT_PANE];
    
    NSView *secondaryView = [self.subviews objectAtIndex: secondaryViewIndex];
    
    collapsableViewWidth = secondaryView.frame.size.width;
    
    if (collapsableViewWidth < 1) 
    {
        collapsed = YES;
        collapsableViewWidth = [self.secondaryPaneMinSize floatValue]; 
    }
}

- (IBAction) collapseSecondaryPane
{
    NSView *rightView = [self.subviews objectAtIndex: primaryViewIndex];
    NSView *leftView = [self.subviews objectAtIndex: secondaryViewIndex];
    
    if (!collapsed) collapsableViewWidth = leftView.frame.size.width;
    if (collapsableViewWidth > [self.secondaryPaneMaxSize floatValue]) collapsableViewWidth = [self.secondaryPaneMaxSize floatValue];
     
    NSInteger newPosition;
    newPosition = -1;
    
    if (collapsed) newPosition = collapsableViewWidth;
    
	NSRect secondaryViewTargetFrame = NSMakeRect( leftView.frame.origin.x, leftView.frame.origin.y, newPosition, leftView.frame.size.height);
     
	NSRect mainViewTargetFrame = NSMakeRect( newPosition + self.dividerThickness, rightView.frame.origin.y, NSMaxX(rightView.frame) - newPosition - self.dividerThickness, rightView.frame.size.height);
   
	[NSAnimationContext beginGrouping];
	[[NSAnimationContext currentContext] setDuration:0.2];
	[[leftView animator] setFrame: secondaryViewTargetFrame];
	[[rightView animator] setFrame: mainViewTargetFrame];
	[NSAnimationContext endGrouping];
    collapsed = !collapsed;

}

#pragma mark -
#pragma mark Delegate Methods

/**
 * The secondary pane will be fixed and not be resized when resizing the whole window
 */
- (void)splitView:(NSSplitView *)sender resizeSubviewsWithOldSize:(NSSize) oldSize
{
    NSView *secondary = [[sender subviews] objectAtIndex:secondaryViewIndex];      
    NSView *primary = [[sender subviews] objectAtIndex:primaryViewIndex];
    float dividerThickness = [sender dividerThickness];         
    NSRect newFrame = [sender frame];                          
    
    NSRect secondaryFrame = [secondary frame];                           
    NSRect primaryFrame = [primary frame];           
    
    secondaryFrame.size.height = newFrame.size.height;               
    
    primaryFrame.size.width = newFrame.size.width - secondaryFrame.size.width - dividerThickness;
    primaryFrame.size.height = newFrame.size.height;   
    
    primaryFrame.origin.x = secondaryFrame.size.width + dividerThickness; 
 
    [secondary setFrame:secondaryFrame];
    [primary setFrame:primaryFrame];
}

/**
 * Controls when the secondary pane size is dragged to the left
 */
- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat) proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex;
{
    if ([self.secondaryPaneMinSize floatValue] < 1) return MIN_SIZE_LEFT_PANE; // If not set from Interface builder
    return [self.secondaryPaneMinSize floatValue];
}

/**
 * Controls when the secondary pane size is dragged to the right
 */
- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat) proposedMaximumPosition ofSubviewAt:(NSInteger)dividerIndex;
{
    if ([self.secondaryPaneMaxSize floatValue] < 1) return MAX_SIZE_LEFT_PANE; // If not set from Interface builder
    return [self.secondaryPaneMaxSize floatValue];
}

- (void) finalize
{
    secondaryPaneMinSize = nil;
    secondaryPaneMaxSize = nil;
    [super finalize];
}
@end
