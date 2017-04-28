//
//  RestaurantDetailsViewController.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASStarRatingView;

@interface RestaurantDetailsViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableViewRestaurantDetails;
@property IBOutlet NSDictionary *dictRestaurantDetails;

@end
