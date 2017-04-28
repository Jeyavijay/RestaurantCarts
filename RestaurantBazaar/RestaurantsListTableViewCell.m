//
//  RestaurantsListTableViewCell.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "RestaurantsListTableViewCell.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation RestaurantsListTableViewCell
@synthesize imageViewRestaurantLogo,viewSplOffer,viewDistance;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)layoutSubviews{
    
    imageViewRestaurantLogo.layer.frame = CGRectMake(imageViewRestaurantLogo.frame.origin.x, imageViewRestaurantLogo.frame.origin.y, imageViewRestaurantLogo.frame.size.width, imageViewRestaurantLogo.frame.size.width);
    imageViewRestaurantLogo.layer.cornerRadius = imageViewRestaurantLogo.frame.size.width/2;
    
    viewSplOffer.layer.borderWidth = 1;
    viewSplOffer.layer.borderColor = UIColorFromRGB(0x0AC83C).CGColor;

    viewDistance.layer.borderWidth = 1;
    viewDistance.layer.borderColor = [UIColor grayColor].CGColor;
    

}

@end
