//
//  Listing.h
//  RainforestBay
//
//  Created by Husein Kareem on 7/27/15.
//  Copyright (c) 2015 Meduse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface Listing : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (nonatomic, strong) NSString *itemName;
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *itemSpecs;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSString *descriptionText;
@property BOOL isPending;
@end

