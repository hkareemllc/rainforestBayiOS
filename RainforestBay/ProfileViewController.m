//
//  ProfileViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onLogoutButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"ProfileToAuth" sender:sender];
}
@end
