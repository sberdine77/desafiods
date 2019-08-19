//
//  DetailsViewController.m
//  DesafioDs
//
//  Created by Sávio Berdine on 16/08/19.
//  Copyright © 2019 Sávio Berdine. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Interface setup
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    
    //Image picker setup
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    
    //Filling the fields on the view
    self.storeId.text = self.store.storeId;
    self.storeName.text = self.store.name;
    self.storePhone.text = self.store.phone;
    self.storeStreet.text = self.store.address.street;
    self.storeNumber.text = self.store.address.number;
    self.storeComplement.text = self.store.address.complement;
    
    self.storeImage.image = [self.store fetchStoreImage];
    
    //Add gesture recognizer leting the Imageview be able to call the image picker
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showCameraOrLibraryAllert)];
    singleTap.numberOfTapsRequired = 1;
    [self.storeImage setUserInteractionEnabled:YES];
    [self.storeImage addGestureRecognizer:singleTap];
}

-(void) showCameraOrLibraryAllert {
    //Seting up the alert that gives the user liberty to choose between camera or library image picker sources
    UIAlertController *pickerAlert = [UIAlertController alertControllerWithTitle:@"Editar foto" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getImageFromSource:UIImagePickerControllerSourceTypeCamera];
    }]];
    [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getImageFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil]];
    [pickerAlert setModalPresentationStyle:UIModalPresentationPopover];
    
    //Turning the alert compatible with iPad Apple standards
    UIPopoverPresentationController *popPresenter = [pickerAlert popoverPresentationController];
    popPresenter.sourceView = self.storeImage;
    popPresenter.sourceRect = self.storeImage.bounds;
    
    //Presenting the alert
    [self presentViewController:pickerAlert animated:YES completion:nil];
}

-(void) getImageFromSource: (UIImagePickerControllerSourceType) sourceType{
    //Checking if the image picker source is avalieble.
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        //If it is not determined if the user give the app permission to access this image source, ask for permission
        if(status == PHAuthorizationStatusNotDetermined) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                //If the app has permission to access this image souce, call the image picker with this image source type
                self.imagePicker.sourceType = sourceType;
                self.imagePicker.delegate = self;
                [self presentViewController:self.imagePicker animated:true completion:nil];
            }];
        }
        //If the app has permission to access this image souce, call the image picker with this image source type
        else if (status == PHAuthorizationStatusAuthorized) {
            self.imagePicker.sourceType = sourceType;
            self.imagePicker.delegate = self;
            [self presentViewController:self.imagePicker animated:true completion:nil];
        }
        //If the user have previously denied permission to the app to access this image source, ask for permission again
        else if (status == PHAuthorizationStatusDenied) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                //If the app has permission to access this image souce, call the image picker with this image source type
                self.imagePicker.sourceType = sourceType;
                self.imagePicker.delegate = self;
                [self presentViewController:self.imagePicker animated:true completion:nil];
            }];
        }
    }
    //If the image picker source is not avalieble, leting the user know by an alert
    else {
        UIAlertController *pickerAlert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Modo de captura da imagem indisponível" preferredStyle:UIAlertControllerStyleAlert];
        [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:pickerAlert animated:YES completion:nil];
    }
}

- (IBAction)editImageButton:(id)sender {
    [self showCameraOrLibraryAllert];
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    //Sve the store image to the local memory
    UIImage * chosenImage = info[UIImagePickerControllerOriginalImage];
    self.store.image = chosenImage;
    [self.store saveStoreImage];
    
    //Put the picked image into the image view
    self.storeImage.image = chosenImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)callToStore:(id)sender {
    NSString *tel = @"tel:";
    NSString *number = [[[[self.store.phone stringByReplacingOccurrencesOfString:@"(" withString:@""] stringByReplacingOccurrencesOfString:@")" withString:@""] stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingOccurrencesOfString:@"-" withString:@""];
    NSString *stringToCall = [tel stringByAppendingString:number];
    //NSLog(stringToCall);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringToCall] options:@{} completionHandler:nil];
}

- (IBAction)openMapsToStoreAddress:(id)sender {
    
    NSString *address = [[[self.store.address.street stringByAppendingString:self.store.address.number] stringByAppendingString:self.store.address.complement] stringByAppendingString:self.store.address.complement];
    
    NSString *url = [NSString stringWithFormat:@"comgooglemaps://?daddr=%@&directionsmode=driving", [address stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]]];
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: url] options:@{} completionHandler:nil];
}

@end
