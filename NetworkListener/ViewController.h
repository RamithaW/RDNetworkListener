//
//  ViewController.h
//  NetworkListener
//
//  Created by Ramitha Wirasinha on 4/21/16.
//  Copyright © 2016 Ramitha Wirasinha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RDNetworkListener.h"

@interface ViewController : UIViewController<RDNetworkListenerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *lblConnectionStatus;

@end

