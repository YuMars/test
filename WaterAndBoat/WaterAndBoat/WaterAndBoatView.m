//
//  WaterAndBoatView.m
//  WaterAndBoat
//
//  Created by Red-Fish on 16/4/5.
//  Copyright © 2016年 dreamtouch. All rights reserved.
//

#import "WaterAndBoatView.h"
#import "WaterView.h"
#import "BoatView.h"

@interface WaterAndBoatView ()
{
    NSInteger boatX;
    NSInteger maskWaterX;
    WaterView *water;
    BoatView *boat ;
}
@end

@implementation WaterAndBoatView

- (instancetype)initWithFrame:(CGRect)frame boatImage:(UIImage *)boatImage{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setWater];
        
        [self setBoatWithBoatImage:boatImage];
    }
    return self;
    
}

- (void)setProgress:(NSInteger)progress{
    
    maskWaterX = boatX = progress * (self.frame.size.width-30) /100;
    
    water.offsetX = maskWaterX;
    
    boat.offsetX = boatX;
}

- (void)setWater{
    water = [[WaterView alloc] initWithFrame:CGRectMake(0, 30, self.frame.size.width, 12)];
    water.layer.cornerRadius = 10.0f;
    water.backgroundColor = [UIColor colorWithRed:151/255.0 green:216/255.0 blue:245/255.0 alpha:1.0f];
    [self addSubview:water];
    water.clipsToBounds = YES;
}

- (void)setBoatWithBoatImage:(UIImage *)boatImage{
    boat = [[BoatView alloc]initWithFrame:CGRectMake(0, 0, 30,45)];
    boat.clipsToBounds = YES;
    boat.boatImage = boatImage;
    boat.backgroundColor = [UIColor clearColor];
    [self addSubview:boat];
}


@end
