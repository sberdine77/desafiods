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

/*Class responsible for dealing with collections of Store objects and for every API communications related with the Store class.*/
@interface StoreRepository : NSObject

@property (nonatomic, strong) NSMutableArray<Store *> *storesArray; //Collection of Store objects
@property (nonatomic, strong) NSString *observer; //Observable object to notify caller View Controller when the store list is fetched from teh API.
@property NSString *allStoresUrl; //API url to fetch all stores
@property UIViewController *vc; //Reference to the View Controller that instantiated this class

/*Constructor. Instantiate this class with a reference to the caller View Controller.*/
-(StoreRepository*) initFromViewController: (UIViewController*) vc;

/*Get all data from all stories from the API, store them in the stores array and notify the caller view controller.*/
-(void) getAllStores;

@end

NS_ASSUME_NONNULL_END
