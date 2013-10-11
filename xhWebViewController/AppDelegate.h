//
//  AppDelegate.h
//  xhWebViewController
//
//  Created by Xiaohe Hu on 10/11/13.
//  Copyright (c) 2013 Xiaohe Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    BOOL internetActive;
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ViewController *myViewController;

@property (nonatomic, retain) Reachability* internetReachable;
@property (nonatomic, retain) Reachability* hostReachable;
@property (nonatomic, retain) NSString *isWirelessAvailable;


+ (AppDelegate *)appDelegate;
@end
