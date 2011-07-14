/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 04/05/2011 
 *
 * ****************************************************************/

#import <Foundation/Foundation.h>

@interface OBSLinkLabel : NSTextField 
{
    NSString *url;
}

@property (nonatomic, readwrite, retain) NSString *url;
@end
