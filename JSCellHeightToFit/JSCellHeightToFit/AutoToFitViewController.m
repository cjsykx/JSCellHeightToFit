//
//  AutoToFitViewController.m
//  JSCellHeightToFit
//
//  Created by ihefe_Hanrovey on 16/7/11.
//  Copyright © 2016年 cjson. All rights reserved.
//

#import "AutoToFitViewController.h"
#import "AutoToFitCell.h"
@interface AutoToFitViewController ()<UITableViewDelegate,UITableViewDataSource,AutoToFitCellDelegate>

@property (weak,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@end

@implementation AutoToFitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.datas = [NSArray arrayWithObjects:@"cell1", @"cell2",@"cell3",nil];

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
    
    // it's important
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

#pragma mark - table view delegate and data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.datas count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"AutoToFitCell";
    AutoToFitCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"AutoToFitCell" owner:self options:nil] lastObject];

    }
    cell.delegate = self;
    cell.textView.text = self.datas[indexPath.row];

    return cell;
}

#pragma mark - TextViewCellDelegate
// Save data after text view update , void data loss when reload cell data!

- (void)textViewCell:(AutoToFitCell *)cell didChangeText:(NSString *)text{
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NSMutableArray *data = [self.datas mutableCopy];
    data[indexPath.row] = text;
    self.datas = [data copy];
}

@end
