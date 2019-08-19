//
//  StoreRepository.m
//  DesafioDs
//
//  Created by Sávio Berdine on 17/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "StoreRepository.h"
#import "ViewController.h"

@implementation StoreRepository

-(StoreRepository*) initFromViewController: (UIViewController*) vc {
    self.vc = vc;
    self.observer = [[NSString alloc] init];
    return self;
}

-(void) getAllStores {
    self.allStoresUrl = @"https://api.myjson.com/bins/hvcbf";
    NSURL *url = [NSURL URLWithString: self.allStoresUrl];
    self.storesArray = [[NSMutableArray alloc] init];
    [self addObserver:self.vc forKeyPath:@"observer" options:NSKeyValueObservingOptionNew context:nil];
    
    //API request:
[[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Stores fetched from api...");
    
    //Cast the data returned to JSON format
    NSString *json = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSData *jsonData = [json dataUsingEncoding:NSASCIIStringEncoding];
    
    //Serialize JSON to NSDictonary
    NSError *err;
    NSDictionary *dataReturned = [NSJSONSerialization JSONObjectWithData:jsonData options: NSJSONReadingAllowFragments error:&err];

    if (error) {
        NSLog(@"Failed to serialise data to JSON: %@", err);
        return;
    }
    
    if (dataReturned[@"lojas"] == nil) {
        NSLog(@"There is no store in api.");
        return;
    }
    
    //Catch the dictionary of stores on the "lojas" key
    NSDictionary *storesDic = dataReturned[@"lojas"];
    if (storesDic == nil) {
        NSLog(@"Data malformed");
    }
    
    //Add fetched stores to the storesArray
    for (NSDictionary *dic in storesDic) {
        Store *singleStore = [[Store alloc] initStoreWithDictionary:dic];
        [self.storesArray addObject:singleStore];
    }
    
    [self setValue:@"This is a text" forKeyPath:@"observer"];
    
    for (Store* stor in self.storesArray) {
        NSLog(@"Store %@", stor);
    }
    
}] resume];
}

@end
