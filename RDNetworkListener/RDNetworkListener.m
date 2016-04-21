//
//  LANetworkListener.m
//  Look App
//
//  Created by Ramitha Wirasinha on 4/14/16.
//  Copyright © 2016 Ramitha Wirasinha. All rights reserved.
//

#import "RDNetworkListener.h"

@implementation RDNetworkListener
@synthesize isConnected;

// Returns the singleton instance with the delegate specified
+ (id)getInstanceWithDelegate:(id)id;
{
    static RDNetworkListener *myInstance = nil;
    
    @synchronized(self) {
        if (myInstance == nil){
            myInstance = [[self alloc] initWithDelegate:id];
        }else{
            [myInstance setDelegate:id];
        }
    }
    return myInstance;
}

// Set the delegate
-(void)setDelegate:(id)id
{
    delegate = id;
}

//Initialize the object with a delegate
-(id)initWithDelegate:(id)id
{
    delegate = id;
    isConnected = NO;
    
    reachabilityInstance = [Reachability reachabilityWithHostname:@"www.google.com"];
    
    __weak typeof(delegate) weakDelegate = delegate;
    __block BOOL *connectionFlag = &(isConnected);
    
    // Internet is reachable
    reachabilityInstance.reachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            if(!*connectionFlag){
                [weakDelegate networkDidConnect];
            }
            *connectionFlag = YES;
        });
    };
    
    // Internet is not reachable
    reachabilityInstance.unreachableBlock = ^(Reachability*reach)
    {
        // Update the UI on the main thread
        dispatch_async(dispatch_get_main_queue(), ^{
            if(*connectionFlag){
                [weakDelegate networkDidDisconnect];
            }
            *connectionFlag = NO;
        });
    };
    
    [reachabilityInstance startNotifier];
    
    return self;
}

@end
