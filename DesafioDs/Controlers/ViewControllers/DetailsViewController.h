//
//  DetailsViewController.h
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailsViewController : UIViewController

@property Store *store;
@property (weak, nonatomic) IBOutlet UIImageView *storeImage;
@property (weak, nonatomic) IBOutlet UILabel *storeId;
@property (weak, nonatomic) IBOutlet UILabel *storeName;
@property (weak, nonatomic) IBOutlet UILabel *storePhone;
@property (weak, nonatomic) IBOutlet UILabel *storeStreet;
@property (weak, nonatomic) IBOutlet UILabel *storeNumber;
@property (weak, nonatomic) IBOutlet UILabel *storeComplement;

@end

NS_ASSUME_NONNULL_END
