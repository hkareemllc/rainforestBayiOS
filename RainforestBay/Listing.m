//
//  Listing.m
//  RainforestBay
//
//  Created by Husein Kareem on 7/27/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import "Listing.h"
#import <Parse/PFObject+Subclass.h>

@implementation Listing

+ (void)load {
    [self registerSubclass];
}

+ (NSString *)parseClassName {
    return @"Listing";
}

@dynamic itemName;
@dynamic condition;
@dynamic itemSpecs;
@dynamic price;
@dynamic descriptionText;
@dynamic isPending;
@end
