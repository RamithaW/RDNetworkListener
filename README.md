# RDNetworkListener
RDNetworkListener is an Objective C code snippet that provides a hook to the network connectivity allowing you to handle connection events.

This is a wrapper written to the [reachability] written by [tony million]

#Installation

1. Add the `RDNetworkListener.h` and `RDNetworkListener.m` files along with the `Reachability.h` and `Reachability.m` files to your project.
2. Add `#import "RDNetworkListener.h"` to the ViewController which you want the network connection to be handled
 - If you want to use this throughout the project, then add the import statement to the precompile header file (.pch file)
3. Register the `RDNetworkListenerDelegate` protocol in the ViewController interface decleration
4. In the `viewDidLoad` lifecycle event of the ViewController, register the delegate using `[RDNetworkListener getInstanceWithDelegate:self];`
  - This will return a reference to the singleton instance. To view the connection status, use the 'isConnected' flag of the instance
5. Implement the two delegate methods to handle the network connectin statuses: `networkDidConnect` and `networkDidDisconnect`  


#Usage

`[RDNetworkListener getInstanceWithDelegate:self];`

Where:
- `self` is the View Controller that will recieve the network connection status triggers

Delegate Methods:
`-(void)networkDidConnect
{
    //When connected to the network
}`

`-(void)networkDidDisconnect
{
    //When disconnected from the network
}`

#Credits
[tony million]

#License

MIT


**Free Software, Hell Yeah!**
[my website]:http://ramitha.info/
[reachability]:https://github.com/tonymillion/Reachability
[tony million]:https://github.com/tonymillion

For more about me, visit [my website]
