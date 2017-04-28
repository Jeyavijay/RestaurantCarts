//
//  BookingsViewController.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 25/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "BookingsViewController.h"
#import "BookingsTableViewCell.h"
#import "EditOrderTableViewCell.h"
#import "BasketCheckOutTableViewCell.h"
#import "orderConfirmationViewController.h"

@interface BookingsViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSMutableArray *arrayBookings;
    IBOutlet UITableView *tableViewBookings;
    NSInteger nSubtotal;
    NSInteger nDiscountTotal;
    NSInteger nAmountToPay;
    int nvatCost;
    UITextField *textFieldQuantity;
    bool bEdit;
}

@end

@implementation BookingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    
}

-(void)viewWillAppear:(BOOL)animated
{
    [[[[[self tabBarController] tabBar] items]
      objectAtIndex:1] setBadgeValue:nil];
    [tableViewBookings registerNib:[UINib nibWithNibName:@"BookingsTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrderList"];
    [tableViewBookings registerNib:[UINib nibWithNibName:@"EditOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"order"];
    [tableViewBookings registerNib:[UINib nibWithNibName:@"BasketCheckOutTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkout"];

    arrayBookings = [[NSMutableArray alloc]init];
    [arrayBookings addObjectsFromArray:[[NSUserDefaults standardUserDefaults] valueForKey:@"Bookings"]];
    [self updateData];
    
}

-(void)updateData{
    if (arrayBookings.count > 0)
    {
        nSubtotal = 0;
        nAmountToPay = 0;
        nDiscountTotal = 0;
        
        for(int i = 0; i < arrayBookings.count ; i++)
        {
            NSString *strQuantity = [[arrayBookings objectAtIndex:i]valueForKey:@"quantity"];
            NSString *strPrice = [[arrayBookings objectAtIndex:i]valueForKey:@"price"];
            
            NSInteger nTotalPrice = [strQuantity integerValue] * [strPrice integerValue];
            nSubtotal = nSubtotal + nTotalPrice;
            
        }
        
        NSLog(@"%ld",(long)nSubtotal);
        
        nvatCost = nSubtotal * .145;
        nAmountToPay = nvatCost + nSubtotal;
        NSLog(@"%d",nvatCost);
        NSLog(@"%ld",(long)nAmountToPay);
        
        tableViewBookings.hidden = NO;
        [tableViewBookings reloadData];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@" Please Add items in tha cart" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
        tableViewBookings.hidden = YES;
        
    }

}


#pragma Tableview Delegates and Datasource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  arrayBookings.count + 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableViewBookings.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    if (indexPath.section == 0)
    {
        EditOrderTableViewCell *cellEdit =[ tableView dequeueReusableCellWithIdentifier:@"order"];
        [cellEdit.buttonEditOrder addTarget:self action:@selector(EditTableView:) forControlEvents:UIControlEventTouchUpInside];
      
        if (bEdit == true)
        {
            [cellEdit.buttonEditOrder setTitle:@"Done" forState:UIControlStateNormal];
        }else
        {
            [cellEdit.buttonEditOrder setTitle:@"Edit" forState:UIControlStateNormal];

        }
        
        return cellEdit;
    }
    else if (indexPath.section <= arrayBookings.count)
    {
        BookingsTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:@"OrderList" ];
        cell.textFieldQuantity.delegate = self;
        cell.textFieldQuantity.tag = indexPath.section-1;
        NSString *strQuantity = [[arrayBookings objectAtIndex:indexPath.section-1]valueForKey:@"quantity"];
        NSString *strPrice = [[arrayBookings objectAtIndex:indexPath.section-1]valueForKey:@"price"];
        
        NSInteger nTotalPrice = [strQuantity integerValue] * [strPrice integerValue];
        cell.textFieldQuantity.text = [NSString stringWithFormat:@"%@x",[[arrayBookings objectAtIndex:indexPath.section-1]valueForKey:@"quantity"]];
        cell.labelCost.text = [NSString stringWithFormat:@"%ld",(long)nTotalPrice];
        cell.labelBookedItem.text = [[arrayBookings objectAtIndex:indexPath.section-1]valueForKey:@"Name"];

        cell.textFieldQuantity.enabled = NO;

        
        return cell;
    }
    else
    {
        BasketCheckOutTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:@"checkout" ];
        cell.labelVat.text = [NSString stringWithFormat:@"%ld",(long)nvatCost];
        cell.labelDiscount.text = @"-";
        cell.labelSubTotal.text = [NSString stringWithFormat:@"%ld",(long)nAmountToPay];
        cell.labelFullTotal.text = [NSString stringWithFormat:@"%ld",(long)nSubtotal];
        cell.labelWholeAmount.text = [NSString stringWithFormat:@"%ld",(long)nAmountToPay];
        cell.labelFullCost.text = [NSString stringWithFormat:@"%ld",(long)nAmountToPay];
        [cell.buttonProceedToPay addTarget:self action:@selector(buttonCheckOut:) forControlEvents:UIControlEventTouchUpInside];


        return cell;
    }
    
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return UITableViewCellEditingStyleNone;
    }else if (indexPath.section <= arrayBookings.count)
    {
        return UITableViewCellEditingStyleDelete;
    }
    else
    {
        return UITableViewCellEditingStyleNone;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = [UIColor whiteColor];
    return headerView;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableViewBookings deselectRowAtIndexPath:indexPath animated:NO];

    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"canEditRowAtIndexPath get called");
    NSLog(@"Index is %ld",(long)indexPath.row);
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //delete object here
        [arrayBookings removeObjectAtIndex:indexPath.section-1];
        [[NSUserDefaults standardUserDefaults]setObject:arrayBookings forKey:@"Bookings"];
        if (arrayBookings.count == 0)
        {
            tableViewBookings.hidden = YES;
        }
        [tableViewBookings reloadData]; // tell table to refresh now
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"accessoryButtonTappedForRowWithIndexPath method get called");
    NSLog(@"Index is %ld",(long)indexPath.row);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
     return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 50;
    }else if (indexPath.section <= arrayBookings.count)
    {
        return UITableViewAutomaticDimension;

    }else
    {
        return 400;
    }
}

-(IBAction)EditTableView:(id)sender
{
    if (bEdit != true)
    {
        bEdit = true;
        [tableViewBookings setEditing:YES];
        [tableViewBookings reloadData];
    }else
    {
        bEdit = false;
        [tableViewBookings setEditing:NO];
        [tableViewBookings reloadData];
    }

}
-(IBAction)buttonCheckOut:(id)sender
{
    orderConfirmationViewController *newViewController = [[orderConfirmationViewController alloc]init];
    newViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                         instantiateViewControllerWithIdentifier:@"orderConfirmationViewController"];
    [tableViewBookings setEditing:NO];
    [self.navigationController pushViewController:newViewController animated:YES];

}

@end
