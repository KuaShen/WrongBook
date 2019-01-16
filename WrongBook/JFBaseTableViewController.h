//
//  JFBaseTableViewController.h
//  WrongBook
//
//  Created by apple on 2017/7/13.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFBaseViewController.h"
#import "MJRefresh.h"


typedef void (^refresh_action)();//用typedef定义一个block类型

@interface JFBaseTableViewController : JFBaseViewController<UITableViewDelegate, UITableViewDataSource>

-(id)initWithStyle:(UITableViewStyle)style;

@property(nonatomic,strong)UITableView *tableview;
@property(nonatomic,assign)BOOL showSeparator;//是否显示cell分割线
@property(nonatomic,assign)UITableViewStyle tableStyle;//列表样式

@property(nonatomic) BOOL ifrespErr;

@property (nonatomic, strong) NSMutableArray *listData;
@property (nonatomic, strong) UIView *errView;         //错误视图
@property (nonatomic, strong) UIView *emptyView;      //无数据视图

@property (nonatomic,assign) NSInteger object_count;

@property (nonatomic,assign) BOOL isInit; //是否已经初始化

@property(nonatomic,copy) NSString *errMessage;

@property(nonatomic,strong) MJRefreshAutoNormalFooter *footer;

/** 分页需要重载的方法 -- 方法名*/
- (NSString *)method;
/** 分页需要重载的方法 -- 参数*/
- (NSDictionary *)params;
/** 分页需要重载的方法 -- 返回值*/
- (NSArray *)parseResponse:(NSArray *)respDic;

- (void)refresh_data;

- (void)hide_footer;

- (void)show_footer;

- (void)addCustomRefresh:(MJRefreshComponentRefreshingBlock)refreshingBlock;

/**
 * 自定义下拉刷新响应 在默认响应之后
 */
- (void)set_custom_header_action:(refresh_action)brock;
/**
 * 自定义上拉加载响应 在默认响应之后
 */
- (void)set_custom_footer_action:(refresh_action)brock;

- (void)allow_RefreshControl;


@end
