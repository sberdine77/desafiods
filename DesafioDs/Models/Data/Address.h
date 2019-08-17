//
//  Address.h
//  DesafioDs
//
//  Created by Sávio Berdine on 17/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Address : NSObject

@property NSString *street;
@property NSNumber *number;
@property NSString *complement;

-(Address*) initAddressWithStreet: (NSString*)street andNumber: (NSNumber*)number andComplement: (NSString*) complement;

@end

NS_ASSUME_NONNULL_END
