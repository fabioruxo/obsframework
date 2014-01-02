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

#import <Cocoa/Cocoa.h>

@interface NSOutlineView (ObjectiveSheep)

- (NSArray *)selectedItems;
- (void)setSelectedItems:(NSArray *)items;
- (void) resetSelection;
@end

