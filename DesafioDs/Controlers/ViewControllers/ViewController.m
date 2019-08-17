//
//  ViewController.m
//  DesafioDs
//
//  Created by Sávio Berdine on 15/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.navigationItem.title = @"Lojas";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    cell.textLabel.text = @"Opa, testando";
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

@end
