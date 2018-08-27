//
//  ViewController.m
//  PictureShow
//
//  Created by caimengnan on 2018/8/27.
//  Copyright © 2018年 frameworkdemo. All rights reserved.
//

#import "ViewController.h"
#import "MyCell.h"
#import "SHowCell.h"

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
        [_tableView registerClass:[MyCell classForCoder] forCellReuseIdentifier:@"mycell"];
        [_tableView registerClass:[SHowCell classForCoder] forCellReuseIdentifier:@"SHowCell"];
        [_tableView registerClass:[UITableViewCell classForCoder] forCellReuseIdentifier:@"cellID"];
    }
    
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 11;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row != 5) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
        cell.textLabel.text = @"当说起Swilling的时候通常是用自定义的方法来替代原有的方法，然后在自定义的方法里调用原有的方法。OC在Runtime里是允许这样操作的。在运行时，OC的方法methods是以C语言的结构体形式出现的，一个被定义为struct objc_method的结构体";
        cell.textLabel.numberOfLines = 0;
        return cell;
        
    } else {
        SHowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SHowCell" forIndexPath:indexPath];
        return cell;
    }
    
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat contentPointY = 5 * 200 - kHeight;
    
    CGFloat contentOffSet = scrollView.contentOffset.y;
    NSLog(@"垂直方向偏移量：%f，临界Y值：%f",scrollView.contentOffset.y,contentPointY);
    
    if (contentOffSet >= contentPointY && contentOffSet <= 5 * 200) {
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
