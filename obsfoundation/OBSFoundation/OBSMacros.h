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

/**
 OBSLog will only log if the DEBUG=1 preprocessor macro is set in your debug configuration.
 In release nothing will be printed. Thanks to Uri Keller: http://zathras.de/angelweb/sourcecode.htm
 */
#if DEBUG
#define	OBSLog(args...)			NSLog( @"%s: %@", __PRETTY_FUNCTION__, [NSString stringWithFormat: args])
#else
#define	OBSLog(args...)			
#endif

/**
 Thanks to Wil Shipley. This function will check anything for emptiness :-)
 http://www.wilshipley.com/blog/2005/10/pimp-my-code-interlude-free-code.html
 */
static inline BOOL IsEmpty(id thing) 
{
    return thing == nil
	|| ([thing respondsToSelector:@selector(length)]
        && [(NSData *)thing length] == 0)
	|| ([thing respondsToSelector:@selector(count)]
        && [(NSArray *)thing count] == 0);
}

/**
 This function will check anything for non-emptiness instead
 */
static inline BOOL IsNotEmpty(id thing) 
{
    return !IsEmpty(thing);
}