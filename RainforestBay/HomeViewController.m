//
//  HomeViewController.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"

@interface HomeViewController ()<UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *categoryView;
@property (weak, nonatomic) IBOutlet UIButton *howItWorksButton;
@property (weak, nonatomic) IBOutlet UIButton *allCategoriesButton;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSInteger currentIndex;
@property (nonatomic, assign) CGPoint scrollingPoint, endPoint;
@property (nonatomic, strong) NSTimer *scrollingTimer;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //view setup
    self.howItWorksButton.layer.cornerRadius = 5.0;
    self.categoryView.layer.cornerRadius = 5.0;
    self.allCategoriesButton.layer.cornerRadius = 5.0;

    //autoscroll UICollectionView
    [self scrollSlowly];
}

#pragma mark - Collection View

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListingID" forIndexPath:indexPath];
    self.currentIndex = indexPath.row;
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"HomeToListings" sender:self];
}

- (void)scrollSlowly {
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathWithIndex:self.currentIndex]];
    NSInteger x = cell.frame.origin.x;
    self.scrollingPoint = CGPointMake(x, -64);
    // Change the timer interval for speed regulation.
    self.scrollingTimer = [NSTimer scheduledTimerWithTimeInterval:0.015 target:self selector:@selector(scrollSlowlyToPoint) userInfo:nil repeats:YES];
}

- (void)scrollSlowlyToPoint {
    self.collectionView.contentOffset = self.scrollingPoint;
    if (self.currentIndex == 4) {
        [self.scrollingTimer invalidate];
    }
    self.scrollingPoint = CGPointMake(self.scrollingPoint.x+1, self.scrollingPoint.y);
}
@end
