//
//  AppDelegate.m
//  xhWebViewController
//
//  Created by Xiaohe Hu on 10/11/13.
//  Copyright (c) 2013 Xiaohe Hu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@implementation AppDelegate
@synthesize isWirelessAvailable, internetReachable, hostReachable, myViewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // check for internet connection
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkNetworkStatus:) name:kReachabilityChangedNotification object:nil];
	
	internetReachable = [Reachability reachabilityForInternetConnection];
	[internetReachable startNotifier];
	
    // check if a pathway to a random host exists
	hostReachable = [Reachability reachabilityWithHostName: @"www.apple.com"];
	[hostReachable startNotifier];
    
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.myViewController = [[ViewController alloc]     initWithNibName:@"ViewController" bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc]  initWithRootViewController:self.myViewController];
    [nav setNavigationBarHidden:YES];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//////////////////////////
// Webcheck when loaded //
//////////////////////////
//
- (void) checkNetworkStatus:(NSNotification *)notice
{
    // called after network status changes
	
	NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
	switch (internetStatus)
	
	{
		case NotReachable:
		{
			//NSLog(@"The internet is down.");
			internetActive = NO;
			isWirelessAvailable = @"NO";
			break;
			
		}
		case ReachableViaWiFi:
		{
			//NSLog(@"The internet is working via WIFI.");
            //	self.internetActive = YES;
			internetActive = YES;
			isWirelessAvailable = @"YES";
			break;
			
		}
		case ReachableViaWWAN:
		{
			//NSLog(@"The internet is working via WWAN.");
            //	self.internetActive = YES;
			internetActive = YES;
            isWirelessAvailable = @"YES";
			break;
		}
	}
	
	NetworkStatus hostStatus = [hostReachable currentReachabilityStatus];
	switch (hostStatus)
	
	{
		case NotReachable:
		{
			//NSLog(@"A gateway to the host server is down.");
			internetActive = NO;
            isWirelessAvailable = @"NO";
			break;
			
		}
		case ReachableViaWiFi:
		{
			//NSLog(@"A gateway to the host server is working via WIFI.");
			internetActive = YES;
			isWirelessAvailable = @"YES";
			break;
			
		}
		case ReachableViaWWAN:
		{
			//NSLog(@"A gateway to the host server is working via WWAN.");
			internetActive = YES;
			isWirelessAvailable = @"YES";
			break;
			
		}
	}
}

+ (AppDelegate *)appDelegate
{
    AppDelegate *theDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    return theDelegate;
}


@end
