//
//  ViewController.m
//  NetworkListener
//
//  Created by Ramitha Wirasinha on 4/21/16.
//  Copyright © 2016 Ramitha Wirasinha. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // This is all you have to add apart from handling the delegates ;)
    // Use it on any ViewContoller to override the delegate
    [RDNetworkListener getInstanceWithDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  -RDNetworkListener delegates

-(void)networkDidConnect
{
    //When connected to the network
    self.lblConnectionStatus.text = @"Connected";
    self.view.backgroundColor = [UIColor greenColor];
}

-(void)networkDidDisconnect
{
    //When disconnected from the network
    self.lblConnectionStatus.text = @"Disconnected";
    self.view.backgroundColor = [UIColor redColor];
}

@end
