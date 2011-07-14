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

#import "UIViewController+ObjectiveSheep.h"
#define APP (AppDelegate_iPad *)[[UIApplication sharedApplication] delegate]

@implementation UIViewController(Hoplo)

#pragma mark -
#pragma mark Controller

- (void) displayView:(Class) controllerClass keepInCache:(BOOL) keep
{
	NSString * aNibName = NSStringFromClass(controllerClass);
	[self displayView: controllerClass withNibName: aNibName]; 
}

- (void) displayView:(Class)controllerClass withNibName: (NSString *) aNibName
{		
	if ([APP currentController])
	{
		[[APP currentController].view removeFromSuperview];
		[APP releaseCurrentController];
	}
	
	UIViewController *newController = [[controllerClass alloc] initWithNibName:aNibName bundle:[NSBundle mainBundle]];
	[APP setCurrentController:newController];
	
	[newController release];
	[[APP currentController].view setAlpha:0.8];
	
	[[APP window] addSubview:[APP currentController].view];
	// Fade in new view
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDuration:0.5];
	[[APP currentController].view setAlpha:1.0];
	[UIView commitAnimations];
	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return NO;
}

@end
