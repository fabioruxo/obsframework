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

#import "UIAlertView+ObjectiveSheep.h"

@implementation UIAlertView(ObjectiveSheep)

- (void) decorateAlertView:(UIAlertView*)alertView
{
	UILabel *theTitle = [alertView valueForKey:@"_titleLabel"]; 
    UILabel *info = [alertView valueForKey:@"_bodyTextLabel"];
    
    [theTitle setTextColor:[UIColor whiteColor]]; 
    theTitle.font = [UIFont fontWithName:@"Helvetica" size: 20]; 
    [info setTextColor:[UIColor whiteColor]]; 
    UIImage *theImage = [UIImage imageNamed:@"AlertViewBackground.png"]; // change here. This will not show anything unless the image exists in your proj
    CGSize theSize = [alertView frame].size;
    
    UIGraphicsBeginImageContext(theSize);    
    [theImage drawInRect:CGRectMake(0, 0, theSize.width, theSize.height)];    
    theImage = UIGraphicsGetImageFromCurrentImageContext();    
    UIGraphicsEndImageContext();
    
    [[alertView layer] setContents:(id)theImage.CGImage];
}

@end
