//
//  QuantityViewController.m
//  RestaurantBazaar
//
//  Created by Jeyavijay on 27/04/17.
//  Copyright © 2017 Jeyavijay N. All rights reserved.
//

#import "QuantityViewController.h"
#import "AppDelegate.h"

@interface QuantityViewController ()
{
    int nQuantity;
    NSInteger ntotal;
    IBOutlet UIView *viewQuantities;
}

@end

@implementation QuantityViewController
@synthesize dictItemDetails,imageVIewItemImage,labelDishTitle,textViewDescription;

- (void)viewDidLoad {
    [super viewDidLoad];
    nQuantity = 1;
    _labelQuantity.text = [NSString stringWithFormat:@"%d",nQuantity];
    _labelTotalCost.text = [NSString stringWithFormat:@"%@",[dictItemDetails valueForKey:@"price"]];
    textViewDescription.text = [dictItemDetails valueForKey:@"description"];
    labelDishTitle.text = [dictItemDetails valueForKey:@"Menu"];
    [self updateUI];
}
-(void)updateUI{
    viewQuantities.layer.borderWidth = 1.0;
    viewQuantities.layer.borderColor = [UIColor grayColor].CGColor;
    _buttonPlus.layer.frame = CGRectMake(_buttonPlus.layer.frame.origin.x, _buttonPlus.layer.frame.origin.y, _buttonPlus.layer.frame.size.width, _buttonPlus.layer.frame.size.width);
    _buttonMinus.layer.frame = CGRectMake(_buttonMinus.layer.frame.origin.x, _buttonMinus.layer.frame.origin.y, _buttonMinus.layer.frame.size.width, _buttonMinus.layer.frame.size.width);
    _buttonMinus.layer.cornerRadius = _buttonMinus.layer.frame.size.width/2;
    _buttonPlus.layer.cornerRadius = _buttonPlus.layer.frame.size.width/2;
    
    imageVIewItemImage.image = [dictItemDetails valueForKey:@"image"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPlusMinus:(id)sender
{
    UIButton *senderButton = (UIButton *) sender;
    NSString *strTotalCost = [dictItemDetails valueForKey:@"price"];
    if (senderButton.tag == 0)
    {
        if (nQuantity > 1) {
            nQuantity = nQuantity - 1;
            _labelQuantity.text = [NSString stringWithFormat:@"%d",nQuantity];
            ntotal = nQuantity * [strTotalCost integerValue];
            _labelTotalCost.text = [NSString stringWithFormat:@"%ld",(long)ntotal];
        }
        
    }else if (senderButton.tag == 1)
    {
        nQuantity = nQuantity + 1;
        _labelQuantity.text = [NSString stringWithFormat:@"%d",nQuantity];
        ntotal = nQuantity * [strTotalCost integerValue];
        _labelTotalCost.text = [NSString stringWithFormat:@"%ld",(long)ntotal];

    }

}
- (IBAction)buttonBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)buttonAddToCart:(id)sender
{
    NSString *strAlertMessage;
    NSMutableArray *arrayBookings = [[NSMutableArray alloc]init];
    NSMutableDictionary *dataBookings = [[NSMutableDictionary alloc]init];
    [dataBookings setValue:[dictItemDetails valueForKey:@"Menu"] forKey:@"Name"];
    [dataBookings setValue:[dictItemDetails valueForKey:@"price"] forKey:@"price"];
    [dataBookings setValue:_labelQuantity.text forKey:@"quantity"];
    [dataBookings setValue:[dictItemDetails valueForKey:@"id"] forKey:@"id"];
    [arrayBookings addObject:dataBookings];
    bool bBreak = false;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObjectsFromArray:[[NSUserDefaults standardUserDefaults] valueForKey:@"Bookings"]];
    NSLog(@"%@",array);

        if (array.count > 0)
        {
            for(int i = 0; i < array.count ; i++)
            {
                NSString *strMenuId = [dictItemDetails valueForKey:@"id"];
                NSString *strCartId = [[array objectAtIndex:i] valueForKey:@"id"];
                if ([strCartId isEqualToString:strMenuId])
                {
                    strAlertMessage = [NSString stringWithFormat:@"%@ added to basket successfulluy",[dictItemDetails valueForKey:@"Menu"]];
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:strAlertMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                    [alert show];

                    
                    [array replaceObjectAtIndex:i withObject:dataBookings];
                    bBreak = YES;
                }
            }
            if (bBreak != true)
            {
                [array addObject:dataBookings];
                strAlertMessage = [NSString stringWithFormat:@"%@ added to basket successfulluy",[dictItemDetails valueForKey:@"Menu"]];
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:strAlertMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                [alert show];

            }
            NSString *strBadgeValue = [NSString stringWithFormat:@"%d",array.count];
            [[[[[self tabBarController] tabBar] items]
              objectAtIndex:1] setBadgeValue:strBadgeValue];
            [[NSUserDefaults standardUserDefaults]setObject:array forKey:@"Bookings"];
            NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Bookings"]);
            
        }else
        {
            [[NSUserDefaults standardUserDefaults]setObject:arrayBookings forKey:@"Bookings"];
            NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"Bookings"]);
            [[[[[self tabBarController] tabBar] items]
              objectAtIndex:1] setBadgeValue:@"1"];
            
            strAlertMessage = [NSString stringWithFormat:@"%@ added to basket successfulluy",[dictItemDetails valueForKey:@"Menu"]];
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:strAlertMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert show];
        }
    
}


@end
