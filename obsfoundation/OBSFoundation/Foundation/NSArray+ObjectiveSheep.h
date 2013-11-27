/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 25/10/2010 
 *
 * ****************************************************************/
 
#import <Foundation/Foundation.h>

@interface NSArray(ObjectiveSheep) 
- (NSArray *) arrayBySortingStrings;
- (NSString *) stringValue;
- (NSString *) stringValueWithSeparator:(NSString*) str;
- (id) firstObject;
- (NSArray *) uniqueMembers;
- (NSArray *) unionWithArray: (NSArray *) anArray;
- (NSArray *) intersectionWithArray: (NSArray *) anArray;
@end
