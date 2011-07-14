//
//  Base64.h
//  Pins
//
//  Created by F + on 5/21/11.
//  Copyright 2011 ObjectiveSheep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base64 : NSObject 
{    
}
+ (NSString *)encodeBase64WithData:(NSData *)objData; 
+ (NSData *)decodeBase64WithString:(NSString *)strBase64; 
@end
