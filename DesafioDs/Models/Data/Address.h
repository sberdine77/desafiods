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
@property NSString *number;
@property NSString *neighborhood;
@property NSString *complement;

-(Address*) initAddressWithDictionary: (NSDictionary*) addressDictionary;

@end

NS_ASSUME_NONNULL_END
