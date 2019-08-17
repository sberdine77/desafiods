//
//  StoreRepository.h
//  DesafioDs
//
//  Created by Sávio Berdine on 17/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"

NS_ASSUME_NONNULL_BEGIN

@interface StoreRepository : NSObject

@property (nonatomic, strong) NSMutableArray<Store *> *storesArray;
@property (nonatomic, strong) NSString *observer;
@property NSString *allStoresUrl;
@property UIViewController *vc;

-(StoreRepository*) initFromViewController: (UIViewController*) vc;

-(void) getAllStores;

@end

NS_ASSUME_NONNULL_END
