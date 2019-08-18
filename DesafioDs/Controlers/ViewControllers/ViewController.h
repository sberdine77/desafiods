//
//  ViewController.h
//  DesafioDs
//
//  Created by Sávio Berdine on 15/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreRepository.h"

@interface ViewController : UITableViewController

@property StoreRepository *storeRepo;
@property UIAlertController *loadingAlert;

@end

