//
//  RestaurantDetailTableViewCell.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ASStarRatingView;


@interface RestaurantDetailTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *labelRestaurantLocation;
@property (retain, nonatomic) IBOutlet ASStarRatingView *staticStarRatingView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewRestaurantImage;
@property (strong, nonatomic) IBOutlet UILabel *labelRestaurantName;
@property (strong, nonatomic) IBOutlet UILabel *labelMinOrderPrice;
@property (strong, nonatomic) IBOutlet UILabel *labelDeliveryCharge;



@end
