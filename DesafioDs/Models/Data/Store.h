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

@property NSString *storeId;
@property NSString *name;
@property Address *address;
@property UIImage *image;
@property NSString *phone;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(Store*) initStoreWithDictionary: (NSDictionary*) storeDictionary;

-(void) saveStoreImage;
-(UIImage *) fetchStoreImage;

@end

NS_ASSUME_NONNULL_END
