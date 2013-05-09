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

#import "NSFileManager+ObjectiveSheep.h"

NSString *NSDocumentsFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}

NSString *NSLibraryFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"Library"];
}

NSString *NSTmpFolder()
{
	return [NSHomeDirectory() stringByAppendingPathComponent:@"tmp"];
}

NSString *NSBundleFolder()
{
	return [[NSBundle mainBundle] bundlePath];
}

NSString *NSApplicationSupportFolder()
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    return ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
}

NSString *NSApplicationSupportFolderForCurrentAPP()
{
	NSString *executableName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleExecutable"];
	return [NSApplicationSupportFolder() stringByAppendingPathComponent:executableName];
}

@implementation NSFileManager(ObjectiveSheep)

+ (NSString *) pathForItemNamed: (NSString *) fname inFolder: (NSString *) path;
{
	NSString *file;
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject]) 
		if ([[file lastPathComponent] isEqualToString:fname]) 
			return [path stringByAppendingPathComponent:file];
	return nil;
}

+ (NSArray *) filesInFolder: (NSString *) path;
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject])
	{
		BOOL isDir;
		[[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingPathComponent:file] isDirectory: &isDir];
		if (!isDir) [results addObject:file];
	}
	return results;
}

+ (NSArray *) folderPathsInFolder: (NSString *) path;
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject])
	{
		BOOL isDir;
		[[NSFileManager defaultManager] fileExistsAtPath:[path stringByAppendingPathComponent:file] isDirectory: &isDir];
		if (isDir) [results addObject:file];
	}
	return results;
}

+ (NSString *) folderContainingFile: (NSString *) filePath;
{
	BOOL isDir;
	[[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory: &isDir];
	if (isDir) return filePath; 
	return [filePath stringByDeletingLastPathComponent];
}

+ (NSArray *) parentFolderPaths: (NSString *) aDir includeCurrentFolder:(BOOL) includeCurrent;
{
	BOOL isDir;
	[[NSFileManager defaultManager] fileExistsAtPath:aDir isDirectory: &isDir];
	if (!isDir) aDir = [NSFileManager folderContainingFile:aDir];
	if (!includeCurrent) aDir = [aDir stringByDeletingLastPathComponent];
	
	NSMutableArray *resultsTmp = (NSMutableArray*)[aDir pathComponents];
	if([resultsTmp count] > 0) [resultsTmp removeObjectAtIndex:0];
	NSMutableArray *results = [[NSMutableArray alloc] initWithCapacity:[resultsTmp count] -1];
	NSString *composedPath = @"/";
	for (int i = 0; i < [resultsTmp count]; i++)
	{
		if (i>0) composedPath = [composedPath stringByAppendingString:@"/"];
		composedPath = [composedPath stringByAppendingString:[resultsTmp objectAtIndex:i]];
		[results addObject:composedPath];
	}
	return results;
}

+ (NSArray *) folderPathsInFolder: (NSString *) path sorted:(BOOL) sortArray;
{
	if (!sortArray)
		return [NSFileManager folderPathsInFolder:path];
	else
	{
		NSArray *sortedDirs = [[NSFileManager folderPathsInFolder:path] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
		return sortedDirs;
	}
	return nil;
}

+ (NSArray *) folderNamesInCurrentFolderOnly: (NSString *) path sorted:(BOOL) sortArray;
{
	NSArray * paths = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
	NSMutableArray *directories = [[NSMutableArray alloc] init];
	for (__strong NSString *path in paths)
	{
		path = [path stringByAppendingString:path];
		BOOL isDir = NO;
		if ([[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir])
		{
			if (isDir) [directories addObject:path];
		} 
	} 
	if (!sortArray) return directories;
	else
	{
		NSArray *sortedDirs = [directories sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
		return sortedDirs;
	}
	return nil;
}

+ (NSArray *) pathsForItemsMatchingExtension: (NSString *) ext inFolder: (NSString *) path;
{
	NSString *file;
	NSMutableArray *results = [NSMutableArray array];
	NSDirectoryEnumerator *dirEnum = [[NSFileManager defaultManager] enumeratorAtPath:path];
	while (file = [dirEnum nextObject]) 
		if ([[file pathExtension] caseInsensitiveCompare:ext] == NSOrderedSame)
			[results addObject:[path stringByAppendingPathComponent:file]];
	return results;
}

- (BOOL) checkOrCreatePath:(NSString*) path
{
    BOOL isDirectory;
	
    BOOL exists = [self fileExistsAtPath:path isDirectory:&isDirectory];
    if (exists) return YES;
		
	NSError *error;
	BOOL success = [self createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error];
    
	return success;
}

- (BOOL) checkIfPathExists:(NSString*)path
{
    BOOL isDirectory;
	
    BOOL exists = [self fileExistsAtPath:path isDirectory:&isDirectory];
    if (exists) return YES;
    return NO;
}


@end
