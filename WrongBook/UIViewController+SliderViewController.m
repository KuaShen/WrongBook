//
//  UIViewController+SliderViewController.m
//  shudaixiongSTU
//
//  Created by apple on 2017/1/30.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "UIViewController+SliderViewController.h"
#import "SliderViewController.h"

@implementation UIViewController (SliderViewController)

- (SliderViewController *)sliderViewController
{
    
    UIViewController *viewcontroller = (UIViewController *)self.parentViewController;
    while (viewcontroller) {
        if ([viewcontroller isKindOfClass:[SliderViewController class]]) {
            return (SliderViewController *)viewcontroller;
        }else if (viewcontroller.parentViewController && viewcontroller.parentViewController!=viewcontroller){
            viewcontroller = (UIViewController *)viewcontroller.parentViewController;
        }else{
            return nil;
        }
    }
    return nil;
}

@end
