//
//  Address.h
//  DesafioDs
//
//  Created by Sávio Berdine on 17/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*Class responsible for modeling Adress data type. It's easier to deal with modular data models on constructing new stores or executing operations with them*/
@interface Address : NSObject

@property NSString *street;
@property NSString *number;
@property NSString *neighborhood;
@property NSString *complement;

/*Construct the addres with a compatible dictionary. {logradouro: "", numero: "", bairro: "", complemento: ""}*/
-(Address*) initAddressWithDictionary: (NSDictionary*) addressDictionary;

/*Init address directely with strings*/
-(Address*) initAddressWithStreet: (NSString*) street andNumber: (NSString*) number andNeighborhood: (NSString*) neighborhood andComplement: (NSString*) complement;


@end

NS_ASSUME_NONNULL_END
