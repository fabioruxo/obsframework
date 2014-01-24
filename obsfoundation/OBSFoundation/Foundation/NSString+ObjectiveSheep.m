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
	int len = (int)[self length];

	reversedStr = [NSMutableString stringWithCapacity:len];     
	
	while (len > 0) [reversedStr appendString:[NSString stringWithFormat:@"%C", [self characterAtIndex:--len]]];   
	return reversedStr;
}

+ (NSString*) stringWithNewUUID
{
    CFUUIDRef uuidObj = CFUUIDCreate(nil);
    NSString *newUUID = (NSString*)CFBridgingRelease(CFUUIDCreateString(nil, uuidObj));
    CFRelease(uuidObj);
    return newUUID;
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
	return (int)[self componentsSeparatedByString:aString].count -1;
}

- (NSString*) stringByCapitalizingFirstCharacter
{
	NSMutableString* sc = [self mutableCopy];
	if ([sc length] < 1) return sc;
	NSString* firstChar = [[self substringToIndex:1] 
						   uppercaseString];
	[sc replaceCharactersInRange:NSMakeRange(0,1) withString:firstChar];
	return sc;
}

- (NSString*) stringWithFirstURLComponent
{
	NSMutableString *result = [[NSMutableString alloc] init];
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
	return [result copy];
}

- (NSString*) md5; 
{
	const char* string = [self UTF8String];
	unsigned char result[16];
	CC_MD5(string, (CC_LONG)strlen(string), result);
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
    NSString *result = (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, NULL, CFSTR("?=&+"), kCFStringEncodingUTF8));
    return result;
}

// See: http://en.wikipedia.org/wiki/Percent-encoding
+(NSString*) stringByDecodingPercentEscapesInURL:(NSString*)str
{
    NSString *ret = @"";
    
    if ([str contains:@"%21"]) ret = [str stringByReplacingString:@"%21" withString:@"!"];
    if ([str contains:@"%23"]) ret = [str stringByReplacingString:@"%23" withString:@"#"];
    if ([str contains:@"%24"]) ret = [str stringByReplacingString:@"%24" withString:@"$"];
    if ([str contains:@"%25"]) ret = [str stringByReplacingString:@"%25" withString:@"%"];
    if ([str contains:@"%3A"]) ret = [str stringByReplacingString:@"%3A" withString:@":"];
    if ([str contains:@"%3B"]) ret = [str stringByReplacingString:@"%3B" withString:@";"];
    if ([str contains:@"%26"]) ret = [str stringByReplacingString:@"%26" withString:@"&"];
    if ([str contains:@"%E0"]) ret = [str stringByReplacingString:@"%E0" withString:@"à"];
    if ([str contains:@"%3D"]) ret = [str stringByReplacingString:@"%3D" withString:@"="];
    if ([str contains:@"%2F"]) ret = [str stringByReplacingString:@"%2F" withString:@"/"];
    if ([str contains:@"%28"]) ret = [str stringByReplacingString:@"%28" withString:@"("];
    if ([str contains:@"%29"]) ret = [str stringByReplacingString:@"%29" withString:@")"];
    if ([str contains:@"%3F"]) ret = [str stringByReplacingString:@"%3F" withString:@"?"];
    
    else ret = str;
    return ret;
}

-(BOOL)equals:(NSString *)str
{
	return [self isEqual:str];
}

-(BOOL)equalsIgnoreCase:(NSString *)str
{
	return [self caseInsensitiveCompare:str] == NSOrderedSame;
}

-(const char *)ascii
{
	return [self cStringUsingEncoding:NSASCIIStringEncoding];
}

+(NSString *)fromAscii:(const char *)c
{
	return [NSString stringWithCString:c encoding:NSASCIIStringEncoding];
}

-(const char *)utf8
{
	return [self cStringUsingEncoding:NSUTF8StringEncoding];
}

+(NSString *)fromUTF8:(const char *)c
{
	return [NSString stringWithCString:c encoding:NSUTF8StringEncoding];
}

+(NSString *) stringFromURL:(NSString *)url
{
	NSURL* u = [[NSURL alloc] initWithString:url];
	NSString *str = [NSString stringWithContentsOfURL:u
                                             encoding: NSUTF8StringEncoding error:nil];
	return str;
}


@end

