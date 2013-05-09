/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 03/04/2011 
 *
 * ****************************************************************/

#import "OBSSplitViewVerticalSecondaryRight.h"

@interface OBSSplitViewVerticalSecondaryRight(Private)
- (void) showSecondaryPaneOnStart:(BOOL)yesOrNo;
@end

@implementation OBSSplitViewVerticalSecondaryRight

@synthesize secondaryPaneSize;
@synthesize secondaryPaneMinSize;
@synthesize secondaryPaneMaxSize;

@synthesize collapsed;

- (void) awakeFromNib
{
    [self setDelegate:self];
    
    primaryViewIndex = 0;
    secondaryViewIndex = 1;
    
    if (IsEmpty(self.secondaryPaneMinSize)) self.secondaryPaneMinSize = [NSNumber numberWithFloat:MIN_SIZE_RIGHT_PANE_OBS];
    if (IsEmpty(self.secondaryPaneMaxSize)) self.secondaryPaneMaxSize = [NSNumber numberWithFloat:MAX_SIZE_RIGHT_PANE_OBS];
    if (IsEmpty(self.secondaryPaneSize)) self.secondaryPaneSize = [NSNumber numberWithFloat:SECONDARY_PANE_SIZE_OBS];
    
    NSView *secondaryView = [self.subviews objectAtIndex: secondaryViewIndex];
    
    self.secondaryPaneSize = [NSNumber numberWithFloat:secondaryView.frame.size.width];
    self.collapsed = NO;
    
    collapsableViewWidth = secondaryView.frame.size.width;
    
    if (collapsableViewWidth < 1)
    {
        self.collapsed = YES;
        collapsableViewWidth = [self.secondaryPaneSize floatValue]; // TODO: Take this from NSDefaults. Save this when resizing in max/min
    }
}

- (IBAction) collapseSecondaryPane
{
    NSView *leftView = [self.subviews objectAtIndex: 0];
    NSView *rightView = [self.subviews objectAtIndex: 1];
    
    if (!self.collapsed) collapsableViewWidth = rightView.frame.size.width;
    if (collapsableViewWidth < 1) collapsableViewWidth = [self.secondaryPaneMinSize floatValue];
    
    NSInteger newRightViewWidth = -1; 
    if (self.collapsed) newRightViewWidth = collapsableViewWidth;

	NSRect newRightViewFrame = NSMakeRect( self.frame.size.width - newRightViewWidth, rightView.frame.origin.y, newRightViewWidth, rightView.frame.size.height);
    
    NSRect newLeftViewFrame =  NSMakeRect( 0 , leftView.frame.origin.y, self.frame.size.width - newRightViewWidth - self.dividerThickness, leftView.frame.size.height);

	[NSAnimationContext beginGrouping];
	[[NSAnimationContext currentContext] setDuration:0.2];
	[[rightView animator] setFrame: newRightViewFrame];
	[[leftView animator] setFrame: newLeftViewFrame];
	[NSAnimationContext endGrouping];
    self.collapsed = !self.collapsed;
}

#pragma mark -
#pragma mark Delegate Methods

/**
 * The secondary pane will be fixed and not be resized when resizing the whole window
 */
//- (void)splitView:(NSSplitView *)sender resizeSubviewsWithOldSize:(NSSize) oldSize
//{
//    NSView *right = [[sender subviews] objectAtIndex:1];      
//    NSView *left = [[sender subviews] objectAtIndex:0];
//    
//    float dividerThickness = [sender dividerThickness];  
//    
//    NSRect newFrame = [sender frame];                          
//    
//    NSRect rightFrame = [right frame];                           
//    NSRect leftFrame = [left frame];           
//    
//                   
//    leftFrame.size.width = newFrame.size.width - rightFrame.size.width - dividerThickness; 
//    leftFrame.size.height = newFrame.size.height;
//    
//    rightFrame.size.width = newFrame.size.width - leftFrame.size.width - dividerThickness;
//    rightFrame.size.height = newFrame.size.height;   
//    
//    rightFrame.origin.x = leftFrame.size.width + dividerThickness; 
//    
//    [right setFrame:rightFrame];
//    [left setFrame:leftFrame];
//}

///**
// * Controls when the secondary pane size is dragged to the left
// */
//- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat) proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex;
//{
//    if ([self.secondaryPaneMaxSize floatValue] < 1) return MAX_SIZE_RIGHT_PANE_OBS; // If not set from Interface builder
//    return self.frame.size.width - [self.secondaryPaneMaxSize floatValue] - [splitView dividerThickness];
//}
//
///**
// * Controls when the secondary pane size is dragged to the right
// */
//- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat) proposedMaximumPosition ofSubviewAt:(NSInteger)dividerIndex;
//{
//    if ([self.secondaryPaneMinSize floatValue] < 1) return MIN_SIZE_RIGHT_PANE_OBS; // If not set from Interface builder
//    return self.frame.size.width - [self.secondaryPaneMinSize floatValue] - [splitView dividerThickness];
//}

- (void) dealloc
{
    
    secondaryPaneSize = nil;
}
@end
