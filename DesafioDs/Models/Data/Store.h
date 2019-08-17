//
//  Store.h
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Address.h"

NS_ASSUME_NONNULL_BEGIN

@interface Store : NSObject

@property NSNumber *storeId;
@property NSString *name;
@property Address *address;
@property UIImage *image;
@property NSString *phone;

-(Store*) initStoreWithId: (NSNumber*)storeId andName: (NSString*)name andAddress: (Address*)address andImage: (UIImage*)image andPhone: (NSString*)phone;

-(Store*) initStoreWithDictionary: (NSDictionary*) storeDictionary;

@end

NS_ASSUME_NONNULL_END
