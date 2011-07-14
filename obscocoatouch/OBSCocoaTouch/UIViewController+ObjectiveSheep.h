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
#import "AppDelegate_iPad.h"
#import "AppDelegate_iPhone.h"

@interface UIViewController(ObjectiveSheep)

/**
 * Watch out for convention over configuration. 
 * This method works fine if your Xib has exactly the same name as the controller.
 *
 * Use this from your AppDelegate or other classes like this:
 * 
 *		LibraryViewController *aController = [[LibraryViewController alloc] initWithNibName:@"LibraryViewController" bundle:[NSBundle mainBundle]];
 *      [aController displayView: [LibraryViewController class] keepInCache:NO];
 *      [window addSubview:[CurrentViewController sharedInstance].currentController.view];
 *      [aController release];	
 *
 */
- (void) displayView:(Class) controllerClass keepInCache:(BOOL) keep;

/**
 * Use this method if you have a specific Xib name
 */
- (void) displayView:(Class)controllerClass withNibName: (NSString *) aNibName;

@end
