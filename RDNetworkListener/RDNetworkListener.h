//
//  LANetworkListener.h
//  Look App
//
//  Created by Ramitha Wirasinha on 4/14/16.
//  Copyright © 2016 Ramitha Wirasinha. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

// Protocol definition starts here
@protocol RDNetworkListenerDelegate <NSObject>
@required
- (void) networkDidConnect;
- (void) networkDidDisconnect;
@end
// Protocol Definition ends here

@interface RDNetworkListener : NSObject
{
    // Delegate to respond back
    id <RDNetworkListenerDelegate> delegate;

    Reachability *reachabilityInstance;
}

+ (id)getInstanceWithDelegate:(id)id;

@property(nonatomic) BOOL isConnected;

@end
