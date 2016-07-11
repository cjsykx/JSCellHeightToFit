//
//  ViewController.m
//  JSCellHeightToFit
//
//  Created by ihefe_Hanrovey on 16/7/11.
//  Copyright © 2016年 cjson. All rights reserved.
//

#import "ViewController.h"
#import "AutoToFitViewController.h"
#import "AcountToFitViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSArray *datas;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - cutsom method
-(void)createTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    
    CGFloat tableViewY = 100;
    tableView.frame = CGRectMake(0, tableViewY, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - tableViewY);
    tableView.delegate = self;
    tableView.dataSource = self;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
}

-(NSArray *)datas{
    
    if (!_datas) {
        
        _datas = [NSArray arrayWithObjects:@"自动计算",@"手动计算", nil];
    }
    return _datas;
}
#pragma mark - table view delegate and data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"FitCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.textLabel.text = self.datas[indexPath.row];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AutoToFitViewController *autoToFit = [[AutoToFitViewController alloc] init];
        [self presentViewController:autoToFit animated:YES completion:nil];
    }else if (indexPath.row == 1) {
        AcountToFitViewController *acountToFit = [[AcountToFitViewController alloc] init];
        [self presentViewController:acountToFit animated:YES completion:nil];
    }

}

@end
