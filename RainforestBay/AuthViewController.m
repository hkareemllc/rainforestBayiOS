//
//  AuthViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "AuthViewController.h"
#import <Parse/Parse.h>

@interface AuthViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *userFieldView;
@property (weak, nonatomic) IBOutlet UIButton *authButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property BOOL isSignUp;
@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //view setup
    self.userFieldView.layer.cornerRadius = 5.0;
    self.authButton.layer.cornerRadius = 5.0;
    self.isSignUp = YES;
    //textfield
    [self.usernameField setReturnKeyType:UIReturnKeyDone];
    [self.passwordField setReturnKeyType:UIReturnKeyDone];
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;

}

#pragma mark - Buttons

- (IBAction)onHomeButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"AuthToHome" sender:self];
}

- (IBAction)onSwitchButtonPressed:(UIButton *)button {
    if ([button.titleLabel.text isEqualToString:@"Log In"]) {
        [button setTitle:@"Sign Up" forState:UIControlStateNormal];
        [self.authButton setTitle:@"Log In" forState:UIControlStateNormal];
        self.isSignUp = NO;
    } else {
        [button setTitle:@"Log In" forState:UIControlStateNormal];
        self.isSignUp = YES;
        [self.authButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    }
}

- (IBAction)onAuthButtonPressed:(UIButton *)button {
    if (self.isSignUp) {
        [self onUserSignUp];
        NSLog(@"sign up");
    } else {
        [self onUserLogin];
        NSLog(@"log in");
    }
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - PFUser

-(void)onUserLogin {
    [PFUser logInWithUsernameInBackground:self.usernameField.text password:self.passwordField.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self performSegueWithIdentifier:@"AuthToHome" sender:self];
                                        } else {
                                            [self showAlerts:[error localizedDescription]];
                                        }
                                    }];
}

-(void)onUserSignUp {
    PFUser *user = [PFUser user];
    user.username = self.usernameField.text;
    user.password = self.passwordField.text;
//    user.email = @"email@example.com";

    // other fields can be set just like with PFObject
//    user[@"phone"] = @"415-392-0202";

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            [self performSegueWithIdentifier:@"AuthToHome" sender:self];
        } else {
            NSString *errorString = [error userInfo][@"error"];
            [self showAlerts:errorString];
        }
    }];
}

#pragma mark - Alerts

-(void)showAlerts:(NSString *)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error, please try again!" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *dismissAction = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //insert action items here
    }];
    [alert addAction:dismissAction];
    [self presentViewController:alert animated:YES completion:nil];
};
@end
