/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 01/04/2011 
 *
 * ****************************************************************/

#import <Foundation/Foundation.h>

@interface NSImage (ObjectiveSheep)
- (void) saveAsJpegWithName:(NSString*) fileName;
- (NSData*) compressImage;
@end
