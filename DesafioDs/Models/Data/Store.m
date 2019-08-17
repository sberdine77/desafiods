//
//  Store.m
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "Store.h"

@implementation Store

-(Store*) initStoreWithDictionary:(NSDictionary *)storeDictionary {
    if (storeDictionary[@"id"] == nil) {
        self.storeId = @"";
        NSLog(@"Store has no id.");
    } else {
        self.storeId = storeDictionary[@"id"];
    }
    
    if (storeDictionary[@"nome"] == nil) {
        self.name = @"";
        NSLog(@"Store has no name.");
    } else {
        self.name = storeDictionary[@"nome"];
    }
    
    if (storeDictionary[@"telefone"] == nil) {
        self.phone = @"";
        NSLog(@"Store has no phone.");
    } else {
        self.phone = storeDictionary[@"telefone"];
    }
    
    if (storeDictionary[@"endereco"] == nil) {
        self.address = Address.new;
        NSLog(@"Store has no address.");
    } else {
        self.address = [[Address alloc] initAddressWithDictionary:storeDictionary[@"endereco"]];
    }
    return self;
}

@end
