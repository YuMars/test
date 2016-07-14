//
//  ViewController.m
//  WaterAndBoat
//
//  Created by Red-Fish on 16/4/5.
//  Copyright © 2016年 dreamtouch. All rights reserved.
//

#import "ViewController.h"
#import "WaterView.h"
#import "BoatView.h"

#import "WaterAndBoatView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    WaterAndBoatView *view = [[WaterAndBoatView alloc] initWithFrame:CGRectMake(10, 100, 340, 45) boatImage:[UIImage imageNamed:@"ship"]];
    [self.view addSubview:view];
    view.progress = 60;
    view.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
