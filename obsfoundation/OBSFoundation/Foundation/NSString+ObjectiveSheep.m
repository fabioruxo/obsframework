/* *****************************************************************
 *                         ObjectiveSheep Framework        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 * 
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 26/01/2010
 *
 * ****************************************************************/

#import <CommonCrypto/CommonDigest.h>
#import "ObjectiveSheep.h"

@implementation NSString (ObjectiveSheep)

-(NSString *) stringByReversingString
{
	NSMutableString *reversedStr;
	int len = [self length];

	reversedStr = [NSMutableString stringWithCapacity:len];     
	
	while (len > 0) [reversedStr appendString:[NSString stringWithFormat:@"%C", [self characterAtIndex:--len]]];   
	return reversedStr;
}

+ (NSString*) stringWithNewUUID
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *newUUID = (NSString*)CFUUIDCreateString(nil, uuidObj);
    CFRelease(uuidObj);
    return [newUUID autorelease];
}

+ (NSString *) stringByConcatenatingStrings:(id) first, ...
{
	NSString * result = @"";
	id eachArg;
	va_list alist;
	if(first)
	{
		result = [result stringByAppendingString:first];
		va_start(alist, first);
		while (eachArg == va_arg(alist, id)) 
			result = [result stringByAppendingString:eachArg];
		va_end(alist);
	}
	return result;
}

- (BOOL) contains: (NSString *) aString 
{
	BOOL ret = NO;
	
	NSRange range = [self rangeOfString : aString];
	if (range.location != NSNotFound) 
	{
		ret = YES;
	}
	return ret;
}

- (NSString *) stringByReplacingString: (NSString *) stringToBeReplaced withString: (NSString *)  replacement 
{
	NSMutableString * str = [NSMutableString stringWithString: self];
	NSRange substr = [str rangeOfString:stringToBeReplaced];
	while (substr.location != NSNotFound) 
	{
		[str replaceCharactersInRange:substr withString:replacement];
		substr = [str rangeOfString:stringToBeReplaced];
	}
	return str;
}

- (BOOL) matches: (NSString *) regex 
{
	return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex ] evaluateWithObject:self];
}

- (NSRange) lastIndexOf: (NSString *) stringToFind inString: (NSString *) theString 
{
	return [theString rangeOfString:stringToFind options:NSBackwardsSearch];
}

- (NSString *) stringByTrimmingString;
{
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (int) occurrencesOfString: (NSString *) aString
{
	return [self componentsSeparatedByString:aString].count -1;
}

- (NSString*) stringByCapitalizingFirstCharacter
{
	NSMutableString* sc = [self mutableCopy];
	if ([sc length] < 1) return [sc autorelease];
	NSString* firstChar = [[self substringToIndex:1] 
						   uppercaseString];
	[sc replaceCharactersInRange:NSMakeRange(0,1) withString:firstChar];
	return [sc autorelease];
}

- (NSString*) stringWithFirstURLComponent
{
	NSMutableString *result = [[[NSMutableString alloc] init] autorelease];
	NSString *schemePart = @"";
	NSString *hostPart = @"";
	NSScanner *scanner = [NSScanner scannerWithString:self];
	if ([scanner scanUpToString:@"://" intoString:&schemePart]) {
		[scanner scanString:@"://" intoString:nil];
		[scanner scanUpToString:@"/" intoString:&hostPart];
	}
	[result appendString:schemePart];
	[result appendString:@"://"];
	[result appendString:hostPart];
	return [[result copy] autorelease];
}

- (NSString*) md5; 
{
	const char* string = [self UTF8String];
	unsigned char result[16];
	CC_MD5(string, strlen(string), result);
	NSString* hash = [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
					  result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], 
					  result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]];
	
	return [hash lowercaseString];
}

- (NSString*) stringByRemovingLeadingAndTrailingSpaces
{
    NSMutableString *tmpString = [NSMutableString stringWithString:self];
    if ([tmpString length] != 0) [tmpString replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange(0,1)];
    if ([tmpString length] != 0) [tmpString replaceOccurrencesOfString:@" " withString:@"" options:0 range:NSMakeRange([tmpString length]-1, 1)];
    NSString *ret = [NSString stringWithFormat:@"%@", tmpString];
    return ret;
}

+ (NSString *)stringByURLEncodingString:(NSString *)str
{
    NSString *result = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8);
    return [result autorelease];
}

@end

