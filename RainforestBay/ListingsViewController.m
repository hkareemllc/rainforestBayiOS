//
//  ListingsViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/27/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "ListingsViewController.h"

@interface ListingsViewController ()

@end

@implementation ListingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onSellSimilarButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"ListingsToSellForm" sender:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
