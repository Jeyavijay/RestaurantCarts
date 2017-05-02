//
//  AppDelegate.h
//  RestaurantBazaar
//
//  Created by Jeyavijay on 25/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    MBProgressHUD *actIndicator;
}
@property (strong, nonatomic) UIWindow *window;
-(void)showIndicator:(NSString *)withTitleString view1:(UIView *)currentView;
-(void)hideIndicator;




@end

