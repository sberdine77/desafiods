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

/*Class responsible form modeling a store. Besides the store properties, this class includes methods to save and fetch the store image on local memory.*/
@interface Store : NSObject

@property NSString *storeId;
@property NSString *name;
@property Address *address;
@property UIImage *image;
@property NSString *phone;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

/*Init store with a compatible dictionary. {lojas:[{id: "", endereco: {logradouro: "", numero: "", bairro: "", complemento: ""}, nome: "", telefone: ""]}*/
-(Store*) initStoreWithDictionary: (NSDictionary*) storeDictionary;

/*Save store image on local memory (linked by storeId)*/
-(void) saveStoreImage;

/*Fetch the store image from local memory*/
-(UIImage *) fetchStoreImage;

@end

NS_ASSUME_NONNULL_END
