//
//  ViewController.m
//  PictureShow
//
//  Created by caimengnan on 2018/8/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

#import "ViewController.h"
#import "SHowCell.h"
#import "TittleCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation ViewController


- (UITableView *)tableView
{
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [_tableView registerNib:[UINib nibWithNibName:@"TittleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"TittleCell"];
        [_tableView registerClass:[SHowCell classForCoder] forCellReuseIdentifier:@"SHowCell"];
        
    }
    
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
//    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第6个Cell显示为图片
    if (indexPath.row != 5) {
        
        TittleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TittleCell" forIndexPath:indexPath];
        return cell;
        
    } else {
        SHowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHowCell" forIndexPath:indexPath];
        return cell;
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //开始显示图片时的偏移量
    CGFloat contentPointY = 5 * cellHeight - kHeight;
    CGFloat contentOffSet = scrollView.contentOffset.y;
    
    NSLog(@"垂直方向偏移量：%f，临界Y值：%f",scrollView.contentOffset.y,contentPointY);
    
    if (contentOffSet >= contentPointY && contentOffSet <= 5 * cellHeight) {
        NSIndexPath *indexs = [NSIndexPath indexPathForRow:5 inSection:0];
        SHowCell *showcell = [self.tableView cellForRowAtIndexPath:indexs];
        showcell.contendOffset = contentOffSet - contentPointY;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
