//
//  ViewController.m
//  ExpandableCell
//
//  Created by Popeye Lau on 2018/10/23.
//  Copyright © 2018 Popeye Lau. All rights reserved.
//

#import "ViewController.h"
#import "ExpandableCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray<NSNumber*> *dataSource;
@end


@implementation ViewController

- (NSMutableArray<NSNumber*> *)dataSource {
    if(_dataSource == nil) {
        _dataSource = [NSMutableArray arrayWithObjects:@NO, @NO, @NO, @NO, nil];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupView];
}

- (void)setupView {
    
    UITableView *tableView = ({
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [view registerClass:[ExpandableCell class] forCellReuseIdentifier:[ExpandableCell identifier]];
        view.estimatedRowHeight = 100;
        view.tableFooterView = [UIView new];
        view.rowHeight = UITableViewAutomaticDimension;
        view;
    });
    
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExpandableCell *cell = [tableView dequeueReusableCellWithIdentifier:[ExpandableCell identifier] forIndexPath:indexPath];
    cell.expanded = self.dataSource[indexPath.row].boolValue;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL isExpanded = self.dataSource[indexPath.row].boolValue;
    self.dataSource[indexPath.row] = @(!isExpanded);
    [tableView beginUpdates];
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [tableView endUpdates];
}

@end
