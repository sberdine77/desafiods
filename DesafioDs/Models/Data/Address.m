//
//  Address.m
//  DesafioDs
//
//  Created by Sávio Berdine on 17/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "Address.h"

@implementation Address

-(Address*) initAddressWithDictionary: (NSDictionary*) addressDictionary {
    if (addressDictionary[@"logradouro"] == nil) {
        self.street = @"";
        NSLog(@"Address has no street");
    } else {
        self.street = addressDictionary[@"logradouro"];
    }
    
    if (addressDictionary[@"numero"] == nil) {
        self.number = @"";
        NSLog(@"Address has no number");
    } else {
        self.number = addressDictionary[@"numero"];
    }
    
    if (addressDictionary[@"bairro"] == nil) {
        self.neighborhood = @"";
        NSLog(@"Address has no neighborhood");
    } else {
        self.neighborhood = addressDictionary[@"bairro"];
    }
    
    if (addressDictionary[@"complemento"] == nil) {
        self.complement = @"";
        NSLog(@"Address has no complement");
    } else {
        self.complement = addressDictionary[@"complemento"];
    }
    
    return self;
}

@end
