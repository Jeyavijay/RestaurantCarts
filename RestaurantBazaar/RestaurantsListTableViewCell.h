//
//  RestaurantsListTableViewCell.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestaurantsListTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageViewRestaurantImage;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewRestaurantLogo;
@property (strong, nonatomic) IBOutlet UILabel *labelRestaurantName;
@property (strong, nonatomic) IBOutlet UILabel *labelRestaurantLocation;
@property (strong, nonatomic) IBOutlet UILabel *labelOpenrClosed;
@property (strong, nonatomic) IBOutlet UIView *viewSplOffer;
@property (strong, nonatomic) IBOutlet UIView *viewDistance;
@property (strong, nonatomic) IBOutlet UILabel *labelDistance;
@property (strong, nonatomic) IBOutlet UILabel *labelSplOffer;

@end
