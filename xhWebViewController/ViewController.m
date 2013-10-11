//
//  ViewController.m
//  xhWebViewController
//
//  Created by Xiaohe Hu on 10/11/13.
//  Copyright (c) 2013 Xiaohe Hu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (BOOL)prefersStatusBarHidden {
    return YES;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)showWebView:(id)sender
{
    xhWebViewController *webView = [[xhWebViewController alloc] initWithNibName:@"xhWebViewController" bundle:nil];
    
    NSString *theUrl = @"http://www.neoscape.com";
    
    [webView socialButton:theUrl];
	webView.title = theUrl;
    [self presentViewController:webView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
	[UIApplication sharedApplication].statusBarHidden = YES;
    self.view.frame = [UIScreen mainScreen].applicationFrame;
    CGRect frame = self.navigationController.navigationBar.frame;
    frame.origin.y = 0;
    self.navigationController.navigationBar.frame = frame;
	self.navigationController.navigationBar.translucent = YES;
    
	[self.navigationController setNavigationBarHidden:YES animated:animated];
	[self.navigationController setToolbarHidden:YES animated:YES];
}
@end
