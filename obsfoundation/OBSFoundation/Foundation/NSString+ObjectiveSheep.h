/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 25/01/2010
 *
 * ****************************************************************/

#import <Foundation/Foundation.h>

@interface NSString(ObjectiveSheep)

/** Reverses a given string */
- (NSString *) stringByReversingString;

/** Creates a string by concatenating other strings together */
+ (NSString *) stringByConcatenatingStrings:(id) first, ...;

/** Checks wether a string contains a string */
- (BOOL) contains: (NSString *) aString; 

/** Replaces a part of a string with another part */
- (NSString *) stringByReplacingString: (NSString *) stringToBeReplaced withString: (NSString *)  replacement;

/** Checks wether a string matches a RegEx pattern */
- (BOOL) matches: (NSString *) regex; 

- (NSRange) lastIndexOf: (NSString *) stringToFind inString: (NSString *) theString; 

/** Returns a string with no whitespaces */
- (NSString *) stringByTrimmingString;

- (int) occurrencesOfString: (NSString *) aString;

/** Capitalizes the first character */
- (NSString*) stringByCapitalizingFirstCharacter;

/** Applies an md5 hash to the string */
- (NSString*) md5; 

/** Returns the first component from an URL as string */
- (NSString *) stringWithFirstURLComponent;

/** Removes the leading and trailing whitespaces from a string */
- (NSString*) stringByRemovingLeadingAndTrailingSpaces;

+ (NSString*) stringWithNewUUID;

+ (NSString *)stringByURLEncodingString:(NSString *)str;

-(BOOL)equals:(NSString *)str;
-(BOOL)equalsIgnoreCase:(NSString *)str;

-(const char *)ascii;
+(NSString *)fromAscii:(const char *)c;

-(const char *)utf8;
+(NSString *)fromUTF8:(const char *)c;

+(NSString *) stringFromURL:(NSString *)url;

@end
