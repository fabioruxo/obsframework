/* *****************************************************************
 *                         ObjectiveSheep Framework       
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 15/11/2010.
 *
 * ****************************************************************/

#import <UIKit/UIKit.h>

@interface UIImage(ObjectiveSheep) 
+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+ (UIImage*)imageWithImage:(UIImage*)image andPinAtX:(float)x andY:(float)y;
@end
