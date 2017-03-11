//
//  JSHomeViewController.m
//  JSLivePlayer
//
//  Created by leo on 10/12/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSHomeViewController.h"

#import "LiveModel.h"
#import "JSHomeTableViewCell.h"
#import "JSNetworkManager.h"
#import <MJRefresh.h>
#import <MJExtension.h>
#import "JSLiveViewController.h"
#import "JSAnimationHeader.h"

@interface JSHomeViewController () <UITableViewDelegate, UITableViewDataSource>

/** <#desc#> */
@property (nonatomic, strong) NSMutableArray *hotArray;

/** <#desc#> */
@property (nonatomic, strong) UITableView *hotTableView;

@end

@implementation JSHomeViewController

static NSString * const ID = @"cell";


- (UITableView *)hotTableView {
    if (_hotTableView == nil) {
        _hotTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, JSScreenWidth, JSScreenHeight-49) style:UITableViewStylePlain];
        _hotTableView.delegate = self;
        _hotTableView.dataSource = self;
        _hotTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_hotTableView];
    }
    return _hotTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"首页";
    _hotArray = [NSMutableArray arrayWithCapacity:5];
    
    [self.hotTableView registerNib:[UINib nibWithNibName:@"JSHomeTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    
    JSAnimationHeader *header = [JSAnimationHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    // 隐藏 更新时间和状态
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    _hotTableView.mj_header = header;
    [_hotTableView.mj_header beginRefreshing];
    
    // 加载数据
    [self loadData];
    
    
}

#pragma mark - 上拉刷新
- (void)loadData {
    NSString *urlStr = @"http://116.211.167.106/api/live/simpleall";
    
    [[JSNetworkManager shareNetworkManager] GET:urlStr parameters:nil success:^(id responseObject) {
        [_hotArray removeAllObjects];
        
        self.hotArray = [LiveModel mj_objectArrayWithKeyValuesArray:responseObject[@"lives"]];
        
        [_hotTableView.mj_header endRefreshing];
        [_hotTableView reloadData];

    } failure:^(NSError *error) {
        JSLog(@"%@", error);
        [_hotTableView.mj_header endRefreshing];
    }];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _hotArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    JSHomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.model = _hotArray[indexPath.row];
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JSLiveViewController *liveVC = [[JSLiveViewController alloc] init];
    liveVC.liveModel = _hotArray[indexPath.row];
    [self presentViewController:liveVC animated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 430;
}

- (void)dealloc {
    self.hotTableView.dataSource = nil;
    self.hotTableView.delegate = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
