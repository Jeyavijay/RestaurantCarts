//
//  ViewController.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 25/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableViewRestaurants;

@end

