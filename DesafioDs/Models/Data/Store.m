//
//  Store.m
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "Store.h"
#import "AppDelegate.h"

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

-(void) saveStoreImage {
    NSData *imageData = UIImageJPEGRepresentation(self.image, 1);
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [[appDelegate persistentContainer] viewContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"StoreImages"];
    NSSortDescriptor *sortDescripotr = [NSSortDescriptor sortDescriptorWithKey:@"storeId" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescripotr]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"storeId == %@", self.storeId]];
    
    NSError *error = nil;
    NSArray *results = [[self.managedObjectContext executeFetchRequest:fetchRequest error:&error] mutableCopy];
    if (error != nil) {
        NSLog(@"Error fetching image: %@", error);
    } else if (results.count > 0) {
        NSManagedObject *imageToBeUpdated = [results objectAtIndex:0];
        [imageToBeUpdated setValue:imageData forKey:@"storeImage"];
        NSError *error1 = nil;
        [self.managedObjectContext save:&error1];
        if (error != nil) {
            NSLog(@"Error saving image: %@", error1);
        }
    } else {
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"StoreImages" inManagedObjectContext:self.managedObjectContext];
        NSManagedObject *newStoreImage = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:self.managedObjectContext];
        
        [newStoreImage setValue:self.storeId forKey:@"storeId"];
        [newStoreImage setValue:imageData forKey:@"storeImage"];
        
        NSError *error2 = nil;
        [self.managedObjectContext save:&error2];
        if (error != nil) {
            NSLog(@"Error saving image: %@", error2);
        }
    }
    
}

-(UIImage *) fetchStoreImage {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [[appDelegate persistentContainer] viewContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"StoreImages"];
    NSSortDescriptor *sortDescripotr = [NSSortDescriptor sortDescriptorWithKey:@"storeId" ascending:YES];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sortDescripotr]];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"storeId == %@", self.storeId]];
    
    NSError *error = nil;
    NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (error != nil) {
        NSLog(@"Error fetching image: %@", error);
        return [UIImage imageNamed:@"letter_L"];
    } else if (results.count == 0) {
        NSLog(@"There is no image for this store on database");
        return [UIImage imageNamed:@"letter_L"];
    } else {
        NSLog(@"Success fetching image");
        NSManagedObject *storeImage = (NSManagedObject *) [results objectAtIndex:0];
        UIImage *imageToReturn = [[UIImage alloc] initWithData:[storeImage valueForKey:@"storeImage"]];
        return imageToReturn;
    }
}

@end
