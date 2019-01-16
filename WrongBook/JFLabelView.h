//
//  JFLabelView.h
//  WrongBook
//
//  Created by apple on 2017/7/16.
//  Copyright © 2017年 lab. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturnIndex) (NSInteger myIndex);
@interface JFLabelView : UIView

@property (nonatomic) CGFloat baseTag;

@property (nonatomic, copy) ReturnIndex returnIndex;

- (void)returnIndexBlock;

- (instancetype)initWithArray:(NSArray *)array andFrameY:(CGFloat)y;

@end
