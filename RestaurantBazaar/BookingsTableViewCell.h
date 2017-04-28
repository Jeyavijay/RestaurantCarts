//
//  BookingsTableViewCell.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookingsTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UITextField *textFieldQuantity;
@property (strong, nonatomic) IBOutlet UILabel *labelBookedItem;
@property (strong, nonatomic) IBOutlet UILabel *labelCost;


@end
