//
//  StoreRepository.h
//  DesafioDs
//
//  Created by Sávio Berdine on 17/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoreRepository : NSObject

@property NSMutableArray *storesArray;

-(NSMutableArray*) getAllStores;

@end

NS_ASSUME_NONNULL_END
