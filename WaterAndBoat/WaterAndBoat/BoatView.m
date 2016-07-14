//
//  BoatView.m
//  WaterAndBoat
//
//  Created by Red-Fish on 16/4/5.
//  Copyright © 2016年 dreamtouch. All rights reserved.
//

#import "BoatView.h"

@interface BoatView ()
{
    UIColor *_currentWaterColor;
    
    float _currentLinePointY;
    
    float a;
    float b;
    
    BOOL rise;
    
    float boatY;
}

@end

@implementation BoatView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[UIColor clearColor]];
        
        a = 1.5;
        b = 0;
        rise = NO;
        
        _currentWaterColor = [UIColor colorWithRed:189/255.0f green:229/255.0f blue:247/255.0f alpha:1];
        _currentLinePointY = 10;
        
        [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(animateWave) userInfo:nil repeats:YES];
        
    }
    return self;
}

-(void)animateWave
{
    if (rise) {
        a += 0.01;
    }else{
        a -= 0.01;
    }
    
    
    if (a<=1) {
        rise = YES;
    }
    
    if (a>=1.5) {
        rise = NO;
    }
    
    
    b+=0.1;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    boatY = _currentLinePointY ;
    for(float x=0;x<=320;x++){
        boatY= a * sin(x/90*M_PI + 1*b/M_PI) * 5 + _currentLinePointY;
    }
    
    [self.boatImage drawInRect:CGRectMake(_offsetX, boatY-4, 30, 30)];
    CGContextDrawImage(context, CGRectMake(0, 0, 0, 0), self.boatImage.CGImage);
    
    
}

- (void)setOffsetX:(NSInteger)offsetX{
    self.frame = CGRectMake(offsetX, self.frame.origin.y  , self.frame.size.width, self.frame.size.height);
}

@end
