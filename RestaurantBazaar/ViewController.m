//
//  ViewController.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "ViewController.h"
#import "RestaurantsListTableViewCell.h"
#import "RestaurantDetailsViewController.h"
#import "AppDelegate.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@interface ViewController ()
{
    NSMutableArray *arrayRestaurantDetails;
    int page;
    BOOL isPageRefreshing;
    AppDelegate *appDelegate;


}
@end

@implementation ViewController
@synthesize tableViewRestaurants;

- (void)viewDidLoad
{
    [super viewDidLoad];
    appDelegate=(AppDelegate*)[[UIApplication sharedApplication] delegate];
    arrayRestaurantDetails = [[NSMutableArray alloc]init];
    [tableViewRestaurants registerNib:[UINib nibWithNibName:@"RestaurantsListTableViewCell" bundle:nil] forCellReuseIdentifier:@"RCELL"];
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];


    [self addObjectsToArray];

}
-(void)viewWillAppear:(BOOL)animated{
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [[[[[self tabBarController] tabBar] items]
      objectAtIndex:1] setBadgeValue:nil];

}
-(void)addObjectsToArray{
    NSMutableDictionary *data = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data2 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data3 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data4 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data5 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data6 = [[NSMutableDictionary alloc]init];
    
    [data setObject:[UIImage imageNamed:@"BRFull"] forKey:@"full_image"];
    [data setObject:[UIImage imageNamed:@"BRLogo"] forKey:@"imageLogo"];
    [data setObject:@"Baskin & Robbins" forKey:@"Name"];
    [data setObject:@"Triplicane" forKey:@"address"];
    [data setObject:@"Get 3 Scoop and get 2  for free" forKey:@"offer"];
    [data setObject:@"2" forKey:@"ratings"];
    [data setObject:@"Rs: 250" forKey:@"minOrder"];
    [data setObject:@"25 Km" forKey:@"distance"];
    [data setObject:@"1" forKey:@"openStatus"];
    [data setObject:@"Rs: 40" forKey:@"deliveryCharge"];

    [arrayRestaurantDetails addObject:data];
    
    [data1 setObject:@"Rs: 300" forKey:@"minOrder"];
    [data1 setObject:[UIImage imageNamed:@"AnjapparFull"] forKey:@"full_image"];
    [data1 setObject:[UIImage imageNamed:@"AnjapparLogo"] forKey:@"imageLogo"];
    [data1 setObject:@"3" forKey:@"ratings"];

    [data1 setObject:@"Anjappar" forKey:@"Name"];
    [data1 setObject:@"Chepauk" forKey:@"address"];
    [data1 setObject:@"Buy 1 chicken briyani and get off of 50%" forKey:@"offer"];
    [data1 setObject:@"34 Km" forKey:@"distance"];
    [data1 setObject:@"4" forKey:@"ratings"];
    [data1 setObject:@"No" forKey:@"deliveryCharge"];
    [data1 setObject:@"0" forKey:@"openStatus"];
    [arrayRestaurantDetails addObject:data1];

    
    [data2 setObject:[UIImage imageNamed:@"ArabFull"] forKey:@"full_image"];
    [data2 setObject:[UIImage imageNamed:@"ArabLogo"] forKey:@"imageLogo"];
    [data2 setObject:@"Arabian Hut" forKey:@"Name"];
    [data2 setObject:@"Royapettah" forKey:@"address"];
    [data2 setObject:@"Get 3 Grill Chicken and get 2  for free" forKey:@"offer"];
    [data2 setObject:@"123 Km" forKey:@"distance"];
    [data2 setObject:@"1" forKey:@"openStatus"];
    [data2 setObject:@"1" forKey:@"ratings"];
    [data2 setObject:@"Rs: 350" forKey:@"minOrder"];
    [data2 setObject:@"No" forKey:@"deliveryCharge"];

    [arrayRestaurantDetails addObject:data2];
    
    [data3 setObject:[UIImage imageNamed:@"BBQFull"] forKey:@"full_image"];
    [data3 setObject:[UIImage imageNamed:@"BBQLogo"] forKey:@"imageLogo"];
    [data3 setObject:@"Barbeque Nation" forKey:@"Name"];
    [data3 setObject:@"Adayar" forKey:@"address"];
    [data3 setObject:@"15% offer of every individuals" forKey:@"offer"];
    [data3 setObject:@"5 Km" forKey:@"distance"];
    [data3 setObject:@"5" forKey:@"ratings"];
    [data3 setObject:@"0" forKey:@"openStatus"];
    [data3 setObject:@"Rs: 200" forKey:@"minOrder"];
    [data3 setObject:@"Rs: 40" forKey:@"deliveryCharge"];
    [arrayRestaurantDetails addObject:data3];

    
    [data4 setObject:[UIImage imageNamed:@"BRFull"] forKey:@"full_image"];
    [data4 setObject:[UIImage imageNamed:@"BRLogo"] forKey:@"imageLogo"];
    [data4 setObject:@"Baskin & Robbins" forKey:@"Name"];
    [data4 setObject:@"Triplicane" forKey:@"address"];
    [data4 setObject:@"Get 3 Scoop and get 2  for free" forKey:@"offer"];
    [data4 setObject:@"15 Km" forKey:@"distance"];
    [data4 setObject:@"Rs: 300" forKey:@"minOrder"];
    [data4 setObject:@"4" forKey:@"ratings"];
    [data4 setObject:@"1" forKey:@"openStatus"];
    [data4 setObject:@"Rs: 40" forKey:@"deliveryCharge"];

    [arrayRestaurantDetails addObject:data4];
    
    [data5 setObject:[UIImage imageNamed:@"HydFull"] forKey:@"full_image"];
    [data5 setObject:[UIImage imageNamed:@"HydLogo"] forKey:@"imageLogo"];
    [data5 setObject:@"Hydrabad Briyani" forKey:@"Name"];
    [data5 setObject:@"T-Nagar" forKey:@"address"];
    [data5 setObject:@"3" forKey:@"ratings"];
    [data5 setObject:@"Rs: 100" forKey:@"minOrder"];
    [data5 setObject:@"flat 50% offer for the purchase above RS:800/-" forKey:@"offer"];
    [data5 setObject:@"34 Km" forKey:@"distance"];
    [data5 setObject:@"1" forKey:@"openStatus"];
    [data5 setObject:@"Rs: 40" forKey:@"deliveryCharge"];
    [arrayRestaurantDetails addObject:data5];
    
    [data6 setObject:[UIImage imageNamed:@"pizzaHutFull"] forKey:@"full_image"];
    [data6 setObject:[UIImage imageNamed:@"PizzaHutLogo"] forKey:@"imageLogo"];
    [data6 setObject:@"Pizza Hut" forKey:@"Name"];
    [data6 setObject:@"Express Avenue" forKey:@"address"];
    [data6 setObject:@"30% Cashback for the purchase of Rs:500/-" forKey:@"offer"];
    [data6 setObject:@"25 Km" forKey:@"distance"];
    [data6 setObject:@"0" forKey:@"openStatus"];
    [data6 setObject:@"2" forKey:@"ratings"];
    [data6 setObject:@"Rs: 250" forKey:@"minOrder"];
    [data6 setObject:@"Rs: 40" forKey:@"deliveryCharge"];

    [arrayRestaurantDetails addObject:data6];

    [tableViewRestaurants reloadData];
}


#pragma Tableview Delegates and Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  arrayRestaurantDetails.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableViewRestaurants.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    static NSString *CellIdentifier=@"RCELL";
    RestaurantsListTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    
    cell.imageViewRestaurantLogo.image = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"imageLogo"];
    cell.imageViewRestaurantImage.image = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"full_image"];
    cell.labelDistance.text = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"distance"];
    cell.labelRestaurantName.text = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"Name"];
    cell.labelSplOffer.text = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"offer"];
    
    NSString *OpenStatus = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"openStatus"];
    if ([OpenStatus isEqualToString:@"1"])
    {
        cell.labelOpenrClosed.text = @"Open";
        cell.labelOpenrClosed.backgroundColor = UIColorFromRGB(0x0AC83C);
    }else
    {
        cell.labelOpenrClosed.text = @"Closed";
        cell.labelOpenrClosed.backgroundColor =  UIColorFromRGB(0xEE0000);
    }
    
    cell.labelRestaurantLocation.text = [[arrayRestaurantDetails objectAtIndex:indexPath.section]valueForKey:@"address"];

    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableViewRestaurants deselectRowAtIndexPath:indexPath animated:NO];
    
    RestaurantDetailsViewController *newViewController = [[RestaurantDetailsViewController alloc]init];
    newViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
             instantiateViewControllerWithIdentifier:@"RestaurantDetailsViewController"];
    newViewController.dictRestaurantDetails = [arrayRestaurantDetails objectAtIndex:indexPath.section];
    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    [self.navigationController pushViewController:newViewController animated:YES];
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 0;
    }
    else
    {
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(self.tableViewRestaurants.contentOffset.y >= (self.tableViewRestaurants.contentSize.height - self.tableViewRestaurants.bounds.size.height))
    {
        if(isPageRefreshing==NO){
            isPageRefreshing=YES;
            [appDelegate showIndicator:@"Loading" view1:self.view];
            [self.tableViewRestaurants reloadData];

            
            [UIView animateWithDuration:5.0
                             animations:^{
                                 self.view.alpha = 1.0;
                             }
                             completion:^(BOOL finished)
            {
                [appDelegate hideIndicator];
                isPageRefreshing=NO;

            }];
        }
    }
}



@end
