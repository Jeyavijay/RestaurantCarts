//
//  RestaurantDetailTableViewCell.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "RestaurantDetailTableViewCell.h"
#import "ASStarRatingView.h"

@implementation RestaurantDetailTableViewCell
@synthesize staticStarRatingView;
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews{
    staticStarRatingView.maxRating = 5;

}

@end
