//
//  DetailsViewController.h
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Store.h"
#import <Photos/Photos.h>

NS_ASSUME_NONNULL_BEGIN

/*Second view controller. Responsible for showing details from the store selected on the main view controller*/
@interface DetailsViewController : UIViewController

@property Store *store; //Store object that will be passed by the main view controller
@property (weak, nonatomic) IBOutlet UIImageView *storeImage;
@property (weak, nonatomic) IBOutlet UILabel *storeId;
@property (weak, nonatomic) IBOutlet UILabel *storeName;
@property (weak, nonatomic) IBOutlet UILabel *storePhone;
@property (weak, nonatomic) IBOutlet UILabel *storeStreet;
@property (weak, nonatomic) IBOutlet UILabel *storeNumber;
@property (weak, nonatomic) IBOutlet UILabel *storeComplement;
@property UIImagePickerController* imagePicker;
@property UIAlertController *loadingAlert;

/*Show an alert that provides the user with library or camera source for the image picker*/
-(void) showCameraOrLibraryAllert;

/*Method responsible for showing the choosed image picker source, deal with disponibility and deal with library and camera access authorizations*/
-(void) getImageFromSource: (UIImagePickerControllerSourceType) sourceType;

@end

NS_ASSUME_NONNULL_END
