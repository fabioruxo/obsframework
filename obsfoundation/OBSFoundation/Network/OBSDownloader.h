/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 * 
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 27/09/2010
 *
 * ****************************************************************/

#define OBSDownloadStarted @"OBSDownloadStarted"
#define OBSDownloadComplete @"OBSDownloadComplete"
#define OBSDownloadUpdatedData @"OBSDownloadUpdatedData"
#import "OBSMacros.h"

#import <Foundation/Foundation.h>

@interface OBSDownloader : NSObject 
{
    NSURLConnection *connection;
    NSInteger currentFileSize;
    NSInteger totalFileSize;
    NSFileHandle *fileHandle;
    NSString* partialFilePath;
    NSString* filePath;
}

@property (nonatomic, assign) NSInteger totalFileSize;
@property (nonatomic, assign) NSInteger currentFileSize;

- (void) downloadFromURL:(NSString*)anUrl toDestinationPath:(NSString*) destinationPath;

@end
