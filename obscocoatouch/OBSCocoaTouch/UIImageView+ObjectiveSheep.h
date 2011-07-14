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

@interface UIImageView(ObjectiveSheep)

+ (UIImageView*) imageViewFromImageWithName: (NSString *) imageName withContextSize:(CGSize) aContextSize inRect:(CGRect) aRect;

@end
