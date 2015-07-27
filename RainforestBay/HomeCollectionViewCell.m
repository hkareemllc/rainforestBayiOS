//
//  HomeCollectionViewCell.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/26/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@implementation HomeCollectionViewCell
-(void)layoutSubviews {
    [super layoutSubviews];
    self.buyButton.layer.cornerRadius = 5.0;
    self.sellButton.layer.cornerRadius = 5.0;
}
@end
