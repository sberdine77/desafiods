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
    //Check if the given dictionary has an "logradouro" field
    if (addressDictionary[@"logradouro"] == nil) {
        self.street = @"";
        NSLog(@"Address has no street");
    } else {
        self.street = addressDictionary[@"logradouro"];
    }
    
    //Check if the given dictionary has an "numero" field
    if (addressDictionary[@"numero"] == nil) {
        self.number = @"";
        NSLog(@"Address has no number");
    } else {
        self.number = addressDictionary[@"numero"];
    }
    
    //Check if the given dictionary has an "bairro" field
    if (addressDictionary[@"bairro"] == nil) {
        self.neighborhood = @"";
        NSLog(@"Address has no neighborhood");
    } else {
        self.neighborhood = addressDictionary[@"bairro"];
    }
    
    //Check if the given dictionary has an "complemento" field
    if (addressDictionary[@"complemento"] == nil) {
        self.complement = @"";
        NSLog(@"Address has no complement");
    } else {
        self.complement = addressDictionary[@"complemento"];
    }
    
    return self;
}

-(Address*) initAddressWithStreet: (NSString*) street andNumber: (NSString*) number andNeighborhood: (NSString*) neighborhood andComplement: (NSString*) complement {
    
    self.street = street;
    self.number = number;
    self.neighborhood = neighborhood;
    self.complement = complement;
    
    return self;
}

@end
