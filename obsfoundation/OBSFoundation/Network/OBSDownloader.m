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

#import "OBSDownloader.h"

@interface OBSDownloader (PrivateMethods)
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;
- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)someData;
- (void) connectionDidFinishLoading:(NSURLConnection *)connection;
@end

@implementation OBSDownloader

#pragma mark -
#pragma mark Properties

@synthesize currentFileSize;
@synthesize totalFileSize;

#pragma mark -
#pragma mark Download

- (void) downloadFromURL:(NSString*)anUrl toDestinationPath:(NSString*) destinationPath
{
    filePath = destinationPath;

    NSURL *url = [NSURL URLWithString:anUrl];
   	NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url
                                                              cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                          timeoutInterval:60.0];
	[theRequest setHTTPShouldHandleCookies:NO];
    connection = [NSURLConnection connectionWithRequest:theRequest delegate:self];
    [connection start];
}

#pragma mark -
#pragma mark Connection delegate methods

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    currentFileSize = 0;
    totalFileSize = (NSInteger)[response expectedContentLength];
    
	partialFilePath = [filePath stringByAppendingString:@".part"];
    
	[[NSFileManager defaultManager] createFileAtPath:partialFilePath contents:[NSData data] attributes:nil];
	fileHandle = [NSFileHandle fileHandleForWritingAtPath: partialFilePath];
	
	[[NSNotificationCenter defaultCenter] postNotificationName:OBSDownloadStarted object:nil];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)someData 
{
    currentFileSize += [someData length];
    [fileHandle writeData: someData];
    [fileHandle synchronizeFile];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:OBSDownloadUpdatedData object:nil];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    [fileHandle synchronizeFile];
    [fileHandle closeFile];

    partialFilePath = [filePath stringByAppendingString:@".part"];
    [[NSFileManager defaultManager] moveItemAtPath:partialFilePath toPath:filePath error:nil];

    [[NSNotificationCenter defaultCenter] postNotificationName:OBSDownloadComplete object:nil];
}


@end