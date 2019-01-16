//
//  JFAnalyseController.h
//  WrongBook
//
//  Created by apple on 2017/7/29.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFBaseViewController.h"

#import "JFDegreeModel.h"
#import "JFAnalyseModel.h"
#import "JFCurveModel.h"
#import "JFObjectModel.h"

@interface JFAnalyseController : JFBaseViewController

@property (nonatomic, strong) JFDegreeModel *degreeModel;

@property (nonatomic, strong) JFAnalyseModel *analyseModel;

@property (nonatomic, strong) JFCurveModel *curveModel;

@property (nonatomic, strong) JFObjectModel *objectModel;

@end
