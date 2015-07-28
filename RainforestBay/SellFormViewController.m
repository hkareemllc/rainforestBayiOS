//
//  SellFormViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/27/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "SellFormViewController.h"
#import "Listing.h"

@interface SellFormViewController ()

@property (weak, nonatomic) IBOutlet UITextField *itemNameField;
@property (weak, nonatomic) IBOutlet UILabel *listingIDLabel;
@property (weak, nonatomic) IBOutlet UITextField *itemSpecsField;
@property (weak, nonatomic) IBOutlet UITextField *conditionField;
@property (weak, nonatomic) IBOutlet UITextField *priceField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionField;
@property BOOL isSuccess;
@end

@implementation SellFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isSuccess = NO;
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        //user signed in
    } else {
        [self showAlertswithMessage:@"Tap Sign In to continue." withTitle:@"Not authorized" andWithAction:@"Sign In"];
    }
}

-(void)viewWillAppear:(BOOL)animated {
    self.isSuccess = NO;
}

#pragma mark - Buttons

- (IBAction)onHelpButtonPressed:(id)sender {

}

- (IBAction)onUploadImagesPressed:(id)sender {

}

- (IBAction)onSubmitForReviewButtonPressed:(id)sender {
    Listing *listing = [Listing new];
    listing.itemName = self.itemNameField.text;
    listing.condition = self.conditionField.text;
    listing.itemSpecs = self.itemSpecsField.text;
    listing.isPending = YES;
    listing.descriptionText = self.descriptionField.text;
    [listing setObject:[PFUser currentUser] forKey:@"createdBy"];
    [listing saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            self.isSuccess = YES;
            [self showAlertswithMessage:@"Item submitted for review." withTitle:@"Success!" andWithAction:@"Dismiss"];
        } else {
            [self showAlertswithMessage:[error localizedDescription] withTitle:@"Error, please try again." andWithAction:@"Dismiss"];
        }
    }];

    //NSString to NSNumber for price
    NSNumberFormatter *priceNum = [[NSNumberFormatter alloc] init];
    priceNum.numberStyle = NSNumberFormatterDecimalStyle;
    listing.price = [priceNum numberFromString:self.priceField.text];
}

#pragma mark - Alerts

-(void)showAlertswithMessage:(NSString *)message withTitle:(NSString *)title andWithAction:(NSString *)action {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if ([action isEqualToString:@"Sign In"]) {
        UIAlertAction *signInAction = [UIAlertAction actionWithTitle:action style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            [self performSegueWithIdentifier:@"SellFormToAuth" sender:self];
        }];
        [alert addAction:signInAction];
    } else {
        UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:action style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            //insert action here
            if (self.isSuccess) {
                [self performSegueWithIdentifier:@"SellFormToHome" sender:self];
            }
        }];
        [alert addAction:dismissAction];
    }
    [self presentViewController:alert animated:YES completion:nil];
}
@end
