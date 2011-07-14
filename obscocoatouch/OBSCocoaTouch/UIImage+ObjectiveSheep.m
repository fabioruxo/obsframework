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

#import "UIImage+ObjectiveSheep.h"

@implementation UIImage(ObjectiveSheep)

#pragma mark -
#pragma mark Scale and crop image

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
{
	UIGraphicsBeginImageContext( newSize );
	[image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}

+ (UIImage*)imageWithImage:(UIImage*)image andPinAtX:(float)x andY:(float)y;
{
	UIGraphicsBeginImageContext( image.size );
	UIImage *pin = [UIImage imageNamed:@"pin.png"];
	
	[image drawInRect:CGRectMake(0,0, image.size.width,image.size.height)];
	
	[pin drawInRect:CGRectMake(x -15, y -20, 30, 30)];
	
	UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	return newImage;
}


@end
