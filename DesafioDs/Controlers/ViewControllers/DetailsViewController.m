//
//  DetailsViewController.m
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.storeId.text = self.store.storeId;
    self.storeName.text = self.store.name;
    self.storePhone.text = self.store.phone;
    self.storeStreet.text = self.store.address.street;
    self.storeNumber.text = self.store.address.number;
    self.storeComplement.text = self.store.address.complement;
}

@end
