//
//  AppDelegate_iPad.h
//  OBSCocoaTouch
//
//  Created by Fabio Russo on 11/15/10.
//  Copyright 2010 GroovyFrog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate_iPad : NSObject <UIApplicationDelegate> 
{
	UIViewController *currentController;
    UIWindow *window;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain, readwrite) UIViewController *currentController;

- (void) releaseCurrentController;

@end

