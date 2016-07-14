//
//  WaterAndBoatView.h
//  WaterAndBoat
//
//  Created by Red-Fish on 16/4/5.
//  Copyright © 2016年 dreamtouch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterAndBoatView : UIView
/**
 *  完成度
 */
@property (assign, nonatomic) NSInteger progress;

- (instancetype)initWithFrame:(CGRect)frame boatImage:(UIImage *)boatImage;
@end
