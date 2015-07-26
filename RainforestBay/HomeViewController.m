//
//  HomeViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *howItWorksButton;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //view setup
    self.signUpButton.layer.cornerRadius = 5.0;
    self.howItWorksButton.layer.cornerRadius = 5.0;
}
@end
