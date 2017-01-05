//
//  JSHomeViewController.m
//  JSLivePlayer
//
//  Created by leo on 10/12/2016.
//  Copyright © 2016 leo. All rights reserved.
//

#import "JSHomeViewController.h"
#import "JSHotRoomViewController.h"
#import "JSHotRoomModel.h"
#import "JSHotTableViewCell.h"
#import <AFNetworking.h>
#import <YYModel.h>
#import "JSLiveViewController.h"

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
    
    _hotArray = [NSMutableArray arrayWithCapacity:5];
    
    [self.hotTableView registerNib:[UINib nibWithNibName:@"JSHotTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    
    // 加载数据
    [self loadData];
    
    
    
    
    
}

- (void)loadData {
    NSString *urlStr = @"http://116.211.167.106/api/live/simpleall";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dicAll = responseObject;
        
        NSArray *array = [dicAll objectForKey:@"lives"];
        
        for (NSDictionary *dic in array) {
            
            JSHotRoomModel *hot = [JSHotRoomModel yy_modelWithJSON:dic];
            
            [_hotArray addObject:hot];
        }
        
        
        [_hotTableView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _hotArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JSHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[JSHotTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = _hotArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JSLiveViewController *liveVC = [[JSLiveViewController alloc] init];
    liveVC.roomModel = _hotArray[indexPath.row];
    
    [self presentViewController:liveVC animated:YES completion:nil];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 430;
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
