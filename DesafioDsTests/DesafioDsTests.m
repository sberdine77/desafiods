//
//  DesafioDsTests.m
//  DesafioDsTests
//
//  Created by Sávio Berdine on 15/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Address.h"

@interface DesafioDsTests : XCTestCase

@property (nonatomic) Address *addressInstanceToTest;

@end

@implementation DesafioDsTests

- (void)setUp {
    [super setUp];
    self.addressInstanceToTest = [[Address alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void)testInitAddressWithSemiEmptyDictionary {
    NSDictionary *dic = @{@"logradouro": @"rua"};
    Address *outAddress = [self.addressInstanceToTest initAddressWithDictionary:dic];
    Address *expectedAddress = [[Address alloc] initAddressWithStreet:@"rua" andNumber:@"" andNeighborhood:@"" andComplement:@""];
    
    XCTAssertEqual(expectedAddress.street, outAddress.street, @"The address created with empty dictionary was not initialized correctly (with empty strings)");
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
