//
//  orderConfirmationViewController.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 28/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "orderConfirmationViewController.h"
#import "BookingsTableViewCell.h"
#import "EditOrderTableViewCell.h"
#import "BasketCheckOutTableViewCell.h"
#import "ShippingViewController.h"


@interface orderConfirmationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    
    IBOutlet UITableView *tableViewOrderConfirmation;
    NSMutableArray *arrayBookings;
    NSInteger nSubtotal;
    NSInteger nDiscountTotal;
    NSInteger nAmountToPay;
    int nvatCost;
    UITextField *textFieldQuantity;
    bool bEdit;
}

@end

@implementation orderConfirmationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [tableViewOrderConfirmation registerNib:[UINib nibWithNibName:@"BookingsTableViewCell" bundle:nil] forCellReuseIdentifier:@"OrderList"];
    [tableViewOrderConfirmation registerNib:[UINib nibWithNibName:@"EditOrderTableViewCell" bundle:nil] forCellReuseIdentifier:@"order"];
    [tableViewOrderConfirmation registerNib:[UINib nibWithNibName:@"BasketCheckOutTableViewCell" bundle:nil] forCellReuseIdentifier:@"checkout"];
    
    arrayBookings = [[NSMutableArray alloc]init];
    [arrayBookings addObjectsFromArray:[[NSUserDefaults standardUserDefaults] valueForKey:@"Bookings"]];
    [self updateData];
    
    // Do any additional setup after loading the view.
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
        
        
        [tableViewOrderConfirmation reloadData];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  arrayBookings.count + 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableViewOrderConfirmation.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
 if (indexPath.section < arrayBookings.count)
    {
        BookingsTableViewCell *cell =[ tableView dequeueReusableCellWithIdentifier:@"OrderList" ];
        NSString *strQuantity = [[arrayBookings objectAtIndex:indexPath.section]valueForKey:@"quantity"];
        NSString *strPrice = [[arrayBookings objectAtIndex:indexPath.section]valueForKey:@"price"];
        
        NSInteger nTotalPrice = [strQuantity integerValue] * [strPrice integerValue];
        cell.textFieldQuantity.text = [NSString stringWithFormat:@"%@x",[[arrayBookings objectAtIndex:indexPath.section]valueForKey:@"quantity"]];
        cell.labelCost.text = [NSString stringWithFormat:@"%ld",(long)nTotalPrice];
        cell.labelBookedItem.text = [[arrayBookings objectAtIndex:indexPath.section]valueForKey:@"Name"];
        
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
        cell.labelFullCost.hidden = YES;
        [cell.buttonProceedToPay setTitle:@"Next" forState:UIControlStateNormal];
        [cell.buttonProceedToPay addTarget:self action:@selector(buttonCheckOut:) forControlEvents:UIControlEventTouchUpInside];
        cell.labelTotalTitle.hidden = YES;
        cell.textFieldCode.enabled = NO;
        cell.textFieldComment.enabled = NO;
        
        
        return cell;
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
    [tableViewOrderConfirmation deselectRowAtIndexPath:indexPath animated:NO];
    
    
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
 if (indexPath.section < arrayBookings.count)
    {
        return UITableViewAutomaticDimension;
        
    }else
    {
        return 400;
    }
}

-(IBAction)buttonCheckOut:(id)sender
{
    ShippingViewController *newViewController = [[ShippingViewController alloc]init];
    newViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                         instantiateViewControllerWithIdentifier:@"ShippingViewController"];
    [self.navigationController pushViewController:newViewController animated:YES];
    
}

- (IBAction)buttonBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}




@end
