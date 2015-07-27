//
//  ProfileViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "ProfileViewController.h"
#import <Parse/Parse.h>

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;
@property (weak, nonatomic) IBOutlet UIButton *editProfileButton;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        [self.barButton setTitle:@"Logout"];
    } else {
        [self.barButton setTitle:@"Sign Up"];
        [self.editProfileButton setTitle:@"" forState:UIControlStateNormal];
    }
}

- (IBAction)onLogoutButtonPressed:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"ProfileToAuth" sender:sender];
}
@end
