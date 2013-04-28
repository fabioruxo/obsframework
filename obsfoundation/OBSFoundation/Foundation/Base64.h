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

#import <Foundation/Foundation.h>

@interface Base64 : NSObject 
{    
}
+ (NSString *)encodeBase64WithData:(NSData *)objData; 
+ (NSData *)decodeBase64WithString:(NSString *)strBase64; 
@end
