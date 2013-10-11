//
//  ViewController.h
//  xhWebViewController
//
//  Created by Xiaohe Hu on 10/11/13.
//  Copyright (c) 2013 Xiaohe Hu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "xhWebViewController.h"
#import "AppDelegate.h"
@interface ViewController : UIViewController
{
    
}

@property (nonatomic, weak) IBOutlet UIButton *webViewBtn;
-(IBAction)showWebView:(id)sender;
@end
