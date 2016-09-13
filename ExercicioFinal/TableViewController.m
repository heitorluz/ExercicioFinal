//
//  TableViewController.m
//  ExercicioFinal
//
//  Created by Heitor Luz on 9/12/16.
//  Copyright © 2016 Heitor Luz. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *table;
@property (nonatomic, strong) NSMutableArray<NSString*> *times;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.table setDataSource:self];
    
    //self.times = @[@"São Paulo", @"Flamengo", @"Corintias", @"Grémio", @"Internacional", @"Coritiba"];
    
    self.times = [[NSMutableArray alloc] initWithObjects:@"São Paulo", @"Palmeiras", @"Corintias", @"Santos", @"Flamento", @"Fluminense", @"Botafogo", @"Cruzeiro", @"Atletico Mineiro", @"Gremio", @"Internacional", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.times.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"
                                                            forIndexPath:indexPath];
    
    NSString *time = [self.times objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:time];
    [cell.textLabel setTextColor:[UIColor blueColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.times removeObjectAtIndex:indexPath.row];
        [tableView reloadData];
    }
    
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
