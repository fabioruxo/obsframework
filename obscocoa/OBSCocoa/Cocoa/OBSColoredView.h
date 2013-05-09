/* *****************************************************************
 *                           Pins        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 24/03/2010 
 *
 * ****************************************************************/

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
#import "OBSMacros.h"

@interface OBSColoredView : NSView 
{
    IBOutlet NSString *color;
}

@property (nonatomic, strong) NSString *color;
@end
