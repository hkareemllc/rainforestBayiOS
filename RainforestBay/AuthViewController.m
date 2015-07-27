//
//  AuthViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "AuthViewController.h"

@interface AuthViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *userFieldView;
@property (weak, nonatomic) IBOutlet UIButton *authButton;
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@end

@implementation AuthViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //view setup
    self.userFieldView.layer.cornerRadius = 5.0;
    self.authButton.layer.cornerRadius = 5.0;

    //textfield
    [self.usernameField setReturnKeyType:UIReturnKeyDone];
    [self.passwordField setReturnKeyType:UIReturnKeyDone];
    self.usernameField.delegate = self;
    self.passwordField.delegate = self;

}

#pragma mark - Buttons

- (IBAction)onSwitchButtonPressed:(id)sender {
}

- (IBAction)onAuthButtonPressed:(UIButton *)sender {
}

#pragma mark - UITextField

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
