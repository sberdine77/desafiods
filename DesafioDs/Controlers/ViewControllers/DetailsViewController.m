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
    self.navigationController.navigationBar.prefersLargeTitles = NO;
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    self.storeId.text = self.store.storeId;
    self.storeName.text = self.store.name;
    self.storePhone.text = self.store.phone;
    self.storeStreet.text = self.store.address.street;
    self.storeNumber.text = self.store.address.number;
    self.storeComplement.text = self.store.address.complement;
    
    self.storeImage.image = [self.store fetchStoreImage];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showAllert)];
    singleTap.numberOfTapsRequired = 1;
    [self.storeImage setUserInteractionEnabled:YES];
    [self.storeImage addGestureRecognizer:singleTap];
}

-(void) showAllert {
    UIAlertController *pickerAlert = [UIAlertController alertControllerWithTitle:@"Editar foto" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getImageFromSource:UIImagePickerControllerSourceTypeCamera];
    }]];
    [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self getImageFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil]];
    [pickerAlert setModalPresentationStyle:UIModalPresentationPopover];
    
    UIPopoverPresentationController *popPresenter = [pickerAlert
                                                     popoverPresentationController];
    popPresenter.sourceView = self.storeImage;
    popPresenter.sourceRect = self.storeImage.bounds;
    
    [self presentViewController:pickerAlert animated:YES completion:nil];
}

-(void) getImageFromSource: (UIImagePickerControllerSourceType) sourceType{
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if(status == PHAuthorizationStatusNotDetermined) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                self.imagePicker.sourceType = sourceType;
                self.imagePicker.delegate = self;
                [self presentViewController:self.imagePicker animated:true completion:nil];
            }];
        } else if (status == PHAuthorizationStatusAuthorized) {
            self.imagePicker.sourceType = sourceType;
            self.imagePicker.delegate = self;
            [self presentViewController:self.imagePicker animated:true completion:nil];
        } else if (status == PHAuthorizationStatusDenied) {
            [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
                self.imagePicker.sourceType = sourceType;
                self.imagePicker.delegate = self;
                [self presentViewController:self.imagePicker animated:true completion:nil];
            }];
        }
    } else {
        UIAlertController *pickerAlert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Modo de captura da imagem indisponível" preferredStyle:UIAlertControllerStyleAlert];
        [pickerAlert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:pickerAlert animated:YES completion:nil];
    }
}

-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage * chosenImage = info[UIImagePickerControllerOriginalImage];
    self.store.image = chosenImage;
    [self.store saveStoreImage];
    
    self.storeImage.image = chosenImage;
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
