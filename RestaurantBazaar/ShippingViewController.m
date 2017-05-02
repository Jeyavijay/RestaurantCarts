//
//  ShippingViewController.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 28/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "ShippingViewController.h"
#import "BookingsViewController.h"

@interface ShippingViewController ()

@end

@implementation ShippingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonDone:(id)sender
{
    BookingsViewController *newViewController = [[BookingsViewController alloc]init];
    newViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                         instantiateViewControllerWithIdentifier:@"BookingsViewController"];
    [self.tabBarController setSelectedIndex:0];
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[[[[self tabBarController] tabBar] items]
      objectAtIndex:1] setBadgeValue:nil];
    [self.navigationController pushViewController:newViewController animated:YES];
}
- (IBAction)buttonBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
