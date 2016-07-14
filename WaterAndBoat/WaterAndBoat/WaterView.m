//
//  WaterView.m
//  WaterAndBoat
//
//  Created by Red-Fish on 16/4/5.
//  Copyright © 2016年 dreamtouch. All rights reserved.
//

#import "WaterView.h"

@interface WaterView() {
    UIColor *_currentWaterColor;
    
    float _currentLinePointY;
    
    float a;
    float b;
    
    BOOL rise;
    UIView *maskview;
}
@end

@implementation WaterView

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

- (void)setOffsetX:(NSInteger)offsetX{
    _offsetX = offsetX;
    maskview = [[UIView alloc] initWithFrame:CGRectMake(offsetX+30, 0, self.frame.size.width, 30)];
    maskview.backgroundColor = [UIColor colorWithRed:151/255.0 green:216/255.0 blue:245/255.0 alpha:1.0f];
    [self addSubview:maskview];
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

- (void)drawRect:(CGRect)rect{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    //画水1
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [_currentWaterColor CGColor]);
    
    float y=_currentLinePointY;
    CGPathMoveToPoint(path, NULL, 0, y);
    for(float x=0;x<=self.frame.size.width;x++){
        y= a * sin( x/180*M_PI + 4*b/M_PI) * 5 + _currentLinePointY+0;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.frame.size.width, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path);
    
    
    CGMutablePathRef path2 = CGPathCreateMutable();
    
    //画水2
    CGContextSetLineWidth(context, 1);
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:227/255.0 green:242/255.0 blue:249/255.0 alpha:1.0f].CGColor);
    
    
    
    CGPathMoveToPoint(path2, NULL, 0, y);
    for(float x=0;x<=self.frame.size.width;x++){
        y= a * sin( (x-self.offsetX-50)/90*M_PI + 1*b/M_PI) * 5 + _currentLinePointY-3;
        CGPathAddLineToPoint(path2, nil, x, y);
    }
    
    CGPathAddLineToPoint(path2, nil, self.frame.size.width, rect.size.height);
    CGPathAddLineToPoint(path2, nil, 0, rect.size.height);
    CGPathAddLineToPoint(path2, nil, 0, _currentLinePointY);
    
    CGContextAddPath(context, path2);
    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(path2);
    
    
    
    
}

@end
