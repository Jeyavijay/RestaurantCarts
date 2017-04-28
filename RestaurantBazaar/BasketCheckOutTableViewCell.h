//
//  BasketCheckOutTableViewCell.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 27/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasketCheckOutTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *labelFullTotal;
@property (strong, nonatomic) IBOutlet UILabel *labelDiscount;
@property (strong, nonatomic) IBOutlet UILabel *labelVat;
@property (strong, nonatomic) IBOutlet UILabel *labelDeliveryFee;
@property (strong, nonatomic) IBOutlet UILabel *labelSubTotal;
@property (strong, nonatomic) IBOutlet UILabel *labelWholeAmount;
@property (strong, nonatomic) IBOutlet UILabel *labelFullCost;
@property (strong, nonatomic) IBOutlet UIButton *buttonProceedToPay;
@property (strong, nonatomic) IBOutlet UITextField *textFieldComment;
@property (strong, nonatomic) IBOutlet UITextField *textFieldCode;
@property (strong, nonatomic) IBOutlet UILabel *labelTotalTitle;



@end
