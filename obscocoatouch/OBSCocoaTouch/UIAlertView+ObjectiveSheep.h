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

#import <Foundation/Foundation.h>
#import "QuartzCore/CALayer.h"

@interface UIAlertView(ObjectiveSheep) 

/**
 * Use this method to create Black (or other in the future) custom decorated UIAlertViews.
 * N.B. Always append ,nil after your UIAlertView init!
 *
 * Example:
 *
 *   UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Errore" message:@"File invalido. Cancellare il libro e sincronizzare nuovamente la libreria." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil, nil];	
 *   [alert show];
 *   [alert decorateAlertView:alert];                
 *   [alert release];
 *
 * Notice the last ,nil ? Bypassing it will crash your app :-/
 */
- (void) decorateAlertView: (UIAlertView*)alertView;
@end
