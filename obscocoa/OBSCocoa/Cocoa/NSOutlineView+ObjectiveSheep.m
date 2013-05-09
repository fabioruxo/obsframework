/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 10/11/2010 
 *
 * ****************************************************************/

#import "NSOutlineView+ObjectiveSheep.h"

@implementation NSOutlineView(ObjectiveSheep)

- (NSArray *) selectedItems 
{
    NSMutableArray *items = [NSMutableArray array];
    NSIndexSet *selectedRows = [self selectedRowIndexes];
    if (selectedRows != nil) 
	{
        for (NSInteger row = [selectedRows firstIndex]; row != NSNotFound; row = [selectedRows indexGreaterThanIndex:row]) 
		{
            [items addObject:[self itemAtRow:row]];
        }
    }
    return items;
}

- (void) setSelectedItems:(NSArray *)items 
{
    // If we are extending the selection, we start with the existing selection; otherwise, we create a new blank set of the indexes.
    NSMutableIndexSet *newSelection = [[NSMutableIndexSet alloc] init];
    
    for (NSInteger i = 0; i < [items count]; i++) 
	{
        NSInteger row = [self rowForItem:[items objectAtIndex:i]];
        if (row >= 0) 
		{
            [newSelection addIndex:row];
        }
    }
    
    [self selectRowIndexes:newSelection byExtendingSelection:NO];
    
}

@end
