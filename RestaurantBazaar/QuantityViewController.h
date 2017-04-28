//
//  QuantityViewController.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 27/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuantityViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *labelRestaurantName;
@property (strong, nonatomic) IBOutlet UIButton *buttonMinus;
@property (strong, nonatomic) IBOutlet UIButton *buttonPlus;
@property (strong, nonatomic) IBOutlet UILabel *labelQuantity;
@property (strong, nonatomic) IBOutlet UILabel *labelTotalCost;
@property (strong, nonatomic) IBOutlet UIImageView *imageVIewItemImage;
@property NSDictionary *dictItemDetails;
@property (strong, nonatomic) IBOutlet UILabel *labelDishTitle;
@property (strong, nonatomic) IBOutlet UITextView *textViewDescription;

@end
