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

#import <Foundation/Foundation.h>
#import "ObjectiveSheep.h"
#define SECONDARY_PANE_SIZE_OBS 260.0
#define MIN_SIZE_RIGHT_PANE_OBS 160.0
#define MAX_SIZE_RIGHT_PANE_OBS 300.0

@interface OBSSplitViewVerticalSecondaryRight : NSSplitView <NSSplitViewDelegate>
{
    NSNumber *secondaryPaneMinSize;
    NSNumber *secondaryPaneMaxSize;
    
    NSNumber *secondaryPaneSize;

    int secondaryViewIndex;
    int primaryViewIndex;

    float collapsableViewWidth;
    BOOL collapsed;
}

/**
 * Set these properties from Interface Builder in the Custom-Class -> User defined variables section.
 * Otherwise they will simply default to MIN_SIZE_LEFT_PANE and MIN_SIZE_RIGHT_PANE
 */
@property (nonatomic, retain) NSNumber *secondaryPaneMinSize;
@property (nonatomic, retain) NSNumber *secondaryPaneMaxSize;

@property (nonatomic, assign) NSNumber * secondaryPaneSize;
@property (nonatomic, assign) BOOL collapsed;

- (IBAction) collapseSecondaryPane;
@end