//
//  AcountToFitViewController.m
//  JSCellHeightToFit
//
//  Created by ihefe_Hanrovey on 16/7/12.
//  Copyright © 2016年 cjson. All rights reserved.
//

#import "AcountToFitViewController.h"
#import "AcountToFitCell.h"
@interface AcountToFitViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@end

@implementation AcountToFitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.datas = [NSArray arrayWithObjects:@"cell1 : fOR dsadasddadadadadadddddd  11113123123123123123123213213123123213123123123123123213", @"cell2 : \n qwe \n qeqwedadsadsadsadsad adsadadasdasd",@"cell3 for 一行",nil];
    [self createTableView];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - cutsom method
-(void)createTableView{
    
    UITableView *tableView = [[UITableView alloc] init];
    
    CGFloat tableViewY = 50;
    tableView.frame = CGRectMake(0, tableViewY, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - tableViewY);
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    
    self.tableView = tableView;
    
}

#pragma mark - table view delegate and data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"AcountToFitCell";
    AcountToFitCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AcountToFitCell" owner:self options:nil] lastObject];
        
    }
    cell.countStr = [self.datas objectAtIndex:indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AcountToFitCell *cell = (AcountToFitCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}

@end
