/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 25/10/2010  
 *
 * ****************************************************************/

#import <Foundation/Foundation.h>

@interface NSFileManager(ObjectiveSheep)

NSString *NSDocumentsFolder();
NSString *NSLibraryFolder();
NSString *NSTmpFolder();
NSString *NSBundleFolder();
NSString *NSApplicationSupportFolder();
NSString *NSApplicationSupportFolderForCurrentAPP();

+ (NSString *) pathForItemNamed: (NSString *) fname inFolder: (NSString *) path;
+ (NSArray *) filesInFolder: (NSString *) path;
+ (NSArray *) folderPathsInFolder: (NSString *) path;
+ (NSArray *) folderPathsInFolder: (NSString *) path sorted:(BOOL) sortArray;
+ (NSArray *) folderNamesInCurrentFolderOnly: (NSString *) path sorted:(BOOL) sortArray;
+ (NSArray *) pathsForItemsMatchingExtension: (NSString *) ext inFolder: (NSString *) path;
+ (NSString *) folderContainingFile: (NSString *) filePath;
+ (NSArray *) parentFolderPaths: (NSString *) aDir includeCurrentFolder:(BOOL) includeCurrent;
- (BOOL) checkOrCreatePath:(NSString*) path;
- (BOOL) checkIfPathExists:(NSString*)path;
@end
