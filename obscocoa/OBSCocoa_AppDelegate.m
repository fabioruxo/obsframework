//
//  OBSCocoa_AppDelegate.m
//  OBSCocoa
//
//  Created by Fabio Russo on 11/15/10.
//  Copyright GroovyFrog 2010 . All rights reserved.
//

#import "OBSCocoa_AppDelegate.h"

@implementation OBSCocoa_AppDelegate

@synthesize window;

- (IBAction)collapseSplitViewSecondaryLeft:sender
{
    [splitView collapseSecondaryPane];
}

- (IBAction)collapseSplitViewSecondaryRight:sender
{
    [splitView2 collapseSecondaryPane];
}

- (void)dealloc 
{
    [window release];
    [super dealloc];
}

@end
