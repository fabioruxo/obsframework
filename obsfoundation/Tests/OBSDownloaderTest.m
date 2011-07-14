/* *****************************************************************
 *                         ObjectiveSheep Framework         
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 27/09/2010.
 *
 * ****************************************************************/
#import <SenTestingKit/SenTestingKit.h>
#import "ObjectiveSheep.h"
#import "OBSDownloader.h"

@interface OBSDownloaderTests : SenTestCase 
{
	BOOL _isDone;
	OBSDownloader *dl;
}
- (void) downloadPartial;
- (void) downloadDone;
@end

@implementation OBSDownloaderTests

- (void) setUp
{
    _isDone = NO;
}

- (void) testDownload
{
    [NSRunLoop currentRunLoop];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadDone) name:OBSDownloadComplete object:nil];
 
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(downloadPartial) name:OBSDownloadUpdatedData object:nil];
    
    dl = [[[OBSDownloader alloc] init] autorelease];
    [dl downloadFromURL:@"http://objectivesheep.com/test/downloadtest.zip" toDestinationPath:@"/Users/fabioruxo/Desktop/OBSDownloaderTestFile.zip"];
	
    while (!_isDone)
    {
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate
                                                  dateWithTimeIntervalSinceNow:1.0]];
    }
	STAssertTrue(YES, @"The notification could not be received!");
}

- (void) downloadDone
{
    _isDone = YES;
    NSLog(@"DL Finished", nil);
}

- (void) downloadPartial
{
    NSLog(@"Downloaded %d of %d", dl.currentFileSize, dl.totalFileSize);
}

@end

