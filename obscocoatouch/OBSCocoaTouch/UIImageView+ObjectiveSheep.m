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

#import "UIImageView+ObjectiveSheep.h"


@implementation UIImageView(ObjectiveSheep)

+ (UIImageView*) imageViewFromImageWithName: (NSString *) imageName withContextSize:(CGSize) aContextSize inRect:(CGRect) aRect 
{
	UIImage *tmpImage = [UIImage imageNamed:imageName];
	UIGraphicsBeginImageContext( aContextSize );
	[tmpImage drawInRect:aRect];
	UIImage* tmpImageFromContext = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	UIImageView *tmpImageView = [[UIImageView alloc] initWithImage:tmpImageFromContext]; 
	return [tmpImageView autorelease];
}

@end
