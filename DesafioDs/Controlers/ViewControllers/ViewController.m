//
//  ViewController.m
//  DesafioDs
//
//  Created by Sávio Berdine on 15/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "ViewController.h"
#import "MainTableViewCell.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.storeRepo = [[StoreRepository alloc] initFromViewController:self];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.navigationItem.title = @"Lojas";
    self.navigationController.navigationBar.prefersLargeTitles = YES;
    [self.storeRepo getAllStores];
    
    self.loadingAlert = [UIAlertController alertControllerWithTitle:@"Aguarde..." message:nil preferredStyle:UIAlertControllerStyleAlert];
    CGRect rect = CGRectMake(10, 5, 50, 50);
    UIActivityIndicatorView *loadingIndicator = [[UIActivityIndicatorView alloc] initWithFrame:rect];
    loadingIndicator.hidesWhenStopped = YES;
    loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [loadingIndicator startAnimating];
    [self.loadingAlert.view addSubview:loadingIndicator];
    [self presentViewController:self.loadingAlert animated:YES completion:nil];
}

-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"observer"]) {
        NSLog(@"Observer triggered");
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.loadingAlert dismissViewControllerAnimated:YES completion:nil];
        });
        //[self removeObserver:self forKeyPath:@"observer" context:nil];
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
    if (!cell) {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = self.storeRepo.storesArray[indexPath.row].name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Id: %@", self.storeRepo.storesArray[indexPath.row].storeId];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.storeRepo.storesArray.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsSegue"]) {
        DetailsViewController *detailsVc = (DetailsViewController*) segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        detailsVc.store = self.storeRepo.storesArray[indexPath.row];
    }
}

@end
