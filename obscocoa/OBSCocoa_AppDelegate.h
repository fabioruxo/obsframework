//
//  OBSCocoa_AppDelegate.h
//  OBSCocoa
//
//  Created by Fabio Russo on 11/15/10.
//  Copyright GroovyFrog 2010 . All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OBSSplitViewVerticalSecondaryLeft.h"
#import "OBSSplitViewVerticalSecondaryRight.h"

@interface OBSCocoa_AppDelegate : NSObject 
{
    NSWindow *window;
    
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    NSManagedObjectModel *managedObjectModel;
    NSManagedObjectContext *managedObjectContext;
    IBOutlet OBSSplitViewVerticalSecondaryLeft *splitView;
    IBOutlet OBSSplitViewVerticalSecondaryRight *splitView2;
}

@property (nonatomic, retain) IBOutlet NSWindow *window;

- (IBAction)collapseSplitViewSecondaryLeft:sender;
- (IBAction)collapseSplitViewSecondaryRight:sender;
@end
