/* *****************************************************************
 *                           Pins        
 * -----------------------------------------------------------------
 *  Copyright (c) 2010 ObjectiveSheep! All rights reserved.
 *
 *  This file contains Original Code.
 *  You may not use this file except if authorized by ObjectiveSheep 
 * -----------------------------------------------------------------
 *  Created by Fabio Russo on 24/03/2010 
 *
 * ****************************************************************/

#import "OBSColoredView.h"

#define START_COLOR_GRADIENT		[NSColor colorWithCalibratedWhite:0.75 alpha:1.0]
#define END_COLOR_GRADIENT          [NSColor colorWithCalibratedWhite:0.90 alpha:1.0]

#define START_DARK_GRADIENT         [NSColor colorWithCalibratedWhite:0.189 alpha:1.000]
#define END_DARK_GRADIENT           [NSColor colorWithCalibratedWhite:0.289 alpha:1.000]

@implementation OBSColoredView
@synthesize color;

-(void) awakeFromNib
{
    if (IsEmpty(self.color)) self.color = @"azure";
}

- (void)drawRect:(NSRect)rect
{
    BOOL fillRect = YES;
    if ([self.color isEqualToString:@"azure"])
    {
        [super drawRect:rect];
        [[NSColor colorWithCalibratedRed:0.63 green:0.63 blue:0.63 alpha:1] set];
    }
    else if ([self.color isEqualToString:@"lightGray"])
    {
        [super drawRect:rect];
        [[NSColor colorWithCalibratedWhite:0.902 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"lightGrayBordered"])
    {
        [super drawRect:rect];
        [[NSColor colorWithCalibratedWhite:0.902 alpha:1.000] set];
        self.layer.borderWidth = 0.5f;
        
        NSColor *gray = [NSColor grayColor];
        NSInteger numberOfComponents = [gray numberOfComponents];
        CGFloat components[numberOfComponents];
        CGColorSpaceRef colorSpace = [[gray colorSpace] CGColorSpace];
        [gray getComponents:(CGFloat *)&components];
        CGColorRef cgColor = CGColorCreate(colorSpace, components);
        
        self.layer.borderColor = cgColor;
    }
    else if ([self.color isEqualToString:@"white"])
    {
        [super drawRect:rect];
        [[NSColor colorWithCalibratedWhite:1.0 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"gray"])
    {
        [super drawRect:rect];
        [[NSColor colorWithCalibratedWhite:0.671 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"darkGray"])
    {
        [super drawRect:rect];
         [[NSColor colorWithCalibratedWhite:0.189 alpha:1.000] set];
    }
    else if ([self.color isEqualToString:@"black"])
    {
        self.layer.borderWidth = 0.5f;
        [super drawRect:rect];
        [[NSColor colorWithCalibratedRed:0.115 green:0.126 blue:0.126 alpha:0.98] set];
        NSColor *gray = [NSColor grayColor];
        NSInteger numberOfComponents = [gray numberOfComponents];
        CGFloat components[numberOfComponents];
        CGColorSpaceRef colorSpace = [[gray colorSpace] CGColorSpace];
        [gray getComponents:(CGFloat *)&components];
        CGColorRef cgColor = CGColorCreate(colorSpace, components);
        
        self.layer.borderColor = cgColor;
    }
    else if ([self.color isEqualToString:@"darkGrayBordered"])
    {
        self.layer.borderWidth = 0.5f;
        [super drawRect:rect];
        [[NSColor colorWithCalibratedWhite:0.189 alpha:1.000] set];
        NSColor *gray = [NSColor grayColor];
        NSInteger numberOfComponents = [gray numberOfComponents];
        CGFloat components[numberOfComponents];
        CGColorSpaceRef colorSpace = [[gray colorSpace] CGColorSpace];
        [gray getComponents:(CGFloat *)&components];
        CGColorRef cgColor = CGColorCreate(colorSpace, components);
        
        self.layer.borderColor = cgColor;
    }
    else if ([self.color isEqualToString:@"transparent"])
    {
        [super drawRect:rect];
        [[NSColor clearColor] set];
        fillRect = NO;
    }
    else if ([self.color isEqualToString:@"gradient"])
    {
        [super drawRect:rect];
        NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:START_COLOR_GRADIENT 
                                                              endingColor:END_COLOR_GRADIENT];
        [gradient drawInRect:[self bounds] angle:90.0];

        self.layer.borderWidth = 0.5f;
        
        NSColor *gray = [NSColor darkGrayColor];
        NSInteger numberOfComponents = [gray numberOfComponents];
        CGFloat components[numberOfComponents];
        CGColorSpaceRef colorSpace = [[gray colorSpace] CGColorSpace];
        [gray getComponents:(CGFloat *)&components];
        CGColorRef cgColor = CGColorCreate(colorSpace, components);
        
        self.layer.borderColor = cgColor;
        
        fillRect = NO;
    }
    else if ([self.color isEqualToString:@"gradientDark"])
    {
        [super drawRect:rect];
        NSGradient *gradient = [[NSGradient alloc] initWithStartingColor:START_DARK_GRADIENT
                                                             endingColor:END_DARK_GRADIENT];
        [gradient drawInRect:[self bounds] angle:90.0];
        
        self.layer.borderWidth = 0.5f;
        
        NSColor *gray = [NSColor grayColor];
        NSInteger numberOfComponents = [gray numberOfComponents];
        CGFloat components[numberOfComponents];
        CGColorSpaceRef colorSpace = [[gray colorSpace] CGColorSpace];
        [gray getComponents:(CGFloat *)&components];
        CGColorRef cgColor = CGColorCreate(colorSpace, components);
        
        self.layer.borderColor = cgColor;
        
        fillRect = NO;
    }
    //[NSColor colorWithCalibratedRed:0.258 green:0.255 blue:0.262 alpha:1.000]
    
    else if ([self.color isEqualToString:@"gradientRounded"])
    {
        DLog(@"Here ... gradientRounded");
        CGContextRef context = [[NSGraphicsContext currentContext] graphicsPort];
//        [super drawRect:rect];
        NSColor *color1 = [NSColor colorWithCalibratedRed:0.667 green:0.667 blue:0.667 alpha:1];
        NSColor *color2 = [NSColor colorWithCalibratedRed:0.833 green:0.833 blue:0.833 alpha:1];
        NSGradient *gradient = [[NSGradient alloc] initWithColorsAndLocations:[NSColor whiteColor], 0.01, [NSColor colorWithCalibratedRed:0.833 green:0.833 blue:0.833 alpha:1], 0.99, color1, 1.0, nil];
        NSShadow *shadow = [[NSShadow alloc]init];
        [shadow setShadowColor:color2];
        [shadow setShadowOffset:NSMakeSize(3.1, -3.1)];
        [shadow setShadowBlurRadius:5];
        
        CGFloat roundedRectangleCornerRadius = 4;
        NSRect roundedRectangleRect = rect;
        NSRect roundedRectangleInnerRect = NSInsetRect(roundedRectangleRect, roundedRectangleCornerRadius, roundedRectangleCornerRadius);
        NSBezierPath *roundedRectanglePath = [NSBezierPath bezierPath];
        [roundedRectanglePath moveToPoint:NSMakePoint(NSMinX(roundedRectangleRect), NSMinY(roundedRectangleRect))];
        [roundedRectanglePath lineToPoint:NSMakePoint(NSMaxX(roundedRectangleRect), NSMinY(roundedRectangleRect))];
        [roundedRectanglePath appendBezierPathWithArcWithCenter:NSMakePoint(NSMaxX(roundedRectangleInnerRect), NSMaxY(roundedRectangleInnerRect)) radius:roundedRectangleCornerRadius startAngle:0 endAngle:90];
        [roundedRectanglePath appendBezierPathWithArcWithCenter:NSMakePoint(NSMinX(roundedRectangleInnerRect), NSMaxY(roundedRectangleInnerRect)) radius:roundedRectangleCornerRadius startAngle:90 endAngle:180];
        [roundedRectanglePath closePath];
        [[NSColor lightGrayColor] set];
        [roundedRectanglePath fill];
        [NSGraphicsContext saveGraphicsState];
        [shadow set];
        CGContextBeginTransparencyLayer(context, NULL);
        [gradient drawInBezierPath:roundedRectanglePath angle:-90];
        CGContextEndTransparencyLayer(context);
        [NSGraphicsContext restoreGraphicsState];
        
        fillRect = NO;
    }
    if (fillRect)
    {
        NSRectFill(rect);
//        if ([self.color isEqualToString:@"darkGray"])
//        {
//            static CIImage *noisePattern = nil;
//            if(noisePattern == nil){
//                CIFilter *randomGenerator = [CIFilter filterWithName:@"CIColorMonochrome"];
//                [randomGenerator setValue:[[CIFilter filterWithName:@"CIRandomGenerator"] valueForKey:@"outputImage"]
//                                   forKey:@"inputImage"];
//                [randomGenerator setDefaults];
//                noisePattern = [randomGenerator valueForKey:@"outputImage"];
//            }
//            [noisePattern drawAtPoint:NSZeroPoint fromRect:self.bounds operation:NSCompositePlusLighter fraction:0.04];
//        }
    }
    
}

@end
