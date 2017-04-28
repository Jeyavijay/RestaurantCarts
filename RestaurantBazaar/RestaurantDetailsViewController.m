//
//  RestaurantDetailsViewController.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 26/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "RestaurantDetailsViewController.h"
#import "RestaurantDetailTableViewCell.h"
#import "ASStarRatingView.h"
#import "RestaurantListTableViewCell.h"
#import "QuantityViewController.h"



@interface RestaurantDetailsViewController ()
{
    NSMutableArray *arrayRestaurantDetails;
    IBOutlet UILabel *labelRestaurantName;

}

@end

@implementation RestaurantDetailsViewController
@synthesize tableViewRestaurantDetails,dictRestaurantDetails;


- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@",dictRestaurantDetails);
    arrayRestaurantDetails = [[NSMutableArray alloc]init];
    
    NSString *strRestName = [dictRestaurantDetails valueForKey:@"Name"];
    labelRestaurantName.text = strRestName;
    [tableViewRestaurantDetails registerNib:[UINib nibWithNibName:@"RestaurantDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    [tableViewRestaurantDetails registerNib:[UINib nibWithNibName:@"RestaurantListTableViewCell" bundle:nil] forCellReuseIdentifier:@"RList"];

    [self addObjectsToArray];
    [tableViewRestaurantDetails reloadData];
}

-(void)addObjectsToArray{
    NSMutableDictionary *data = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data1 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data2 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data3 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data4 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data5 = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *data6 = [[NSMutableDictionary alloc]init];
    
    [data setObject:@"Eggs" forKey:@"Menu"];
    [data setObject:@"45" forKey:@"price"];
    [data setObject:@"1" forKey:@"id"];

    [data setObject:[UIImage imageNamed:@"eggBriyani"] forKey:@"image"];
    [data setObject:@"A world-renowned Indian dish, biryani takes time and practice to make but is worth every bit of the effort. Long-grained rice (like basmati) flavored with exotic spices such as saffron is layered with lamb, chicken, fish, or vegetables cooked in a thick gravy." forKey:@"description"];


    [arrayRestaurantDetails addObject:data];
    [data1 setObject:@"Chilly Prawn" forKey:@"Menu"];
    [data1 setObject:@"2" forKey:@"id"];

    [data1 setObject:@"200" forKey:@"price"];
    [data1 setObject:@"Prawn fry is considered to be the signature dish of Kerala." forKey:@"description"];
    [data1 setObject:[UIImage imageNamed:@"prawnFry"] forKey:@"image"];

    [arrayRestaurantDetails addObject:data1];
    [data2 setObject:@"Mutton Fry" forKey:@"Menu"];
    [data2 setObject:@"3" forKey:@"id"];

    [data2 setObject:@"250" forKey:@"price"];
    [data2 setObject:@" Mutton fry is a delicious snack or a side dish recipe made using boneless mutton pieces and a common mutton dish in hyderabad" forKey:@"description"];
    [data2 setObject:[UIImage imageNamed:@"muttonFry"] forKey:@"image"];

    [arrayRestaurantDetails addObject:data2];
  
    [data3 setObject:@"4" forKey:@"id"];

    [data3 setObject:@"Liver Fry" forKey:@"Menu"];
    [data3 setObject:@"200" forKey:@"price"];
    [data3 setObject:@"Chicken Liver Pepper fry is a delicious chicken dish made with chicken liver cubes shallow fried with black pepper." forKey:@"description"];

    [data3 setObject:[UIImage imageNamed:@"liverFry"] forKey:@"image"];

    [arrayRestaurantDetails addObject:data3];
    [data4 setObject:@"Chicken Fry" forKey:@"Menu"];
    [data4 setObject:@"5" forKey:@"id"];

    [data4 setObject:[UIImage imageNamed:@"muttonFry"] forKey:@"image"];

    [data4 setObject:@"100" forKey:@"price"];
    [data4 setObject:@"chicken fry is a spicy chicken fry recipe with all the dry spices available at home and is done in a typical south indian style which looks mouth watering and appealing and is the best chicken side dish" forKey:@"description"];

    [arrayRestaurantDetails addObject:data4];
    [data5 setObject:@"Cool Drinks" forKey:@"Menu"];
    [data5 setObject:@"Refreshing Drinks You'll Love Long After Summer's Over. Cool off with these fruity, alcohol-free cocktails. Created with Sketch." forKey:@"description"];
    [data5 setObject:[UIImage imageNamed:@"drinks"] forKey:@"image"];
    [data5 setObject:@"6" forKey:@"id"];

    [data5 setObject:@"40" forKey:@"price"];
    [arrayRestaurantDetails addObject:data5];
    [data6 setObject:@"Briyani" forKey:@"Menu"];
    [data6 setObject:@"CHICKEN BRIYANI. This is a great chicken meal to enjoy with the whole family and friends" forKey:@"description"];
    [data6 setObject:[UIImage imageNamed:@"ChickenBriyani"] forKey:@"image"];
    [data6 setObject:@"7" forKey:@"id"];

    [data6 setObject:@"120" forKey:@"price"];
    [arrayRestaurantDetails addObject:data6];
    [tableViewRestaurantDetails reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma Tableview Delegates and Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  arrayRestaurantDetails.count + 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableViewRestaurantDetails.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    if (indexPath.section == 0)
    {
        static NSString *CellIdentifier=@"DetailCell";
        RestaurantDetailTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
        
        
        cell.imageViewRestaurantImage.image = [dictRestaurantDetails valueForKey:@"imageLogo"];
        cell.labelMinOrderPrice.text = [dictRestaurantDetails valueForKey:@"minOrder"];
        cell.labelDeliveryCharge.text = [dictRestaurantDetails valueForKey:@"deliveryCharge"];
        cell.labelRestaurantName.text = [dictRestaurantDetails valueForKey:@"Name"];
        cell.labelRestaurantLocation.text = [dictRestaurantDetails valueForKey:@"address"];
    
        NSString *strRatings = [dictRestaurantDetails valueForKey:@"ratings"];
        cell.staticStarRatingView.rating = [strRatings integerValue];
        
        return cell;
    }
    else
    {
        static NSString *CellIdentifier=@"RList";
        RestaurantListTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
        cell.labelMenuList.text = [[arrayRestaurantDetails objectAtIndex:indexPath.section - 1]valueForKey:@"Menu"];
        cell.labelCost.text = [NSString stringWithFormat:@"Rs: %@",[[arrayRestaurantDetails objectAtIndex:indexPath.section - 1]valueForKey:@"price"]];
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor clearColor];
    return headerView;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableViewRestaurantDetails deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.section == 0)
    {
        
    }else
    {
        QuantityViewController *newViewController = [[QuantityViewController alloc]init];
        newViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                             instantiateViewControllerWithIdentifier:@"QuantityViewController"];
        newViewController.dictItemDetails = [arrayRestaurantDetails objectAtIndex:indexPath.section-1];
        
        [self.navigationController pushViewController:newViewController animated:YES];

    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
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
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 120;
    }
    else
    {
        return 50;
    }
}

- (IBAction)buttonBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
