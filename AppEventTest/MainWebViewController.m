//
//  ViewController.m
//  AppEventTest
//
//  Created by Kun Wang on 3/4/16.
//  Copyright © 2016 mizuky.com. All rights reserved.
//

#import "MainWebViewController.h"
#import "Jockey.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface MainWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MainWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate=self;
    NSString *urlAddress = @"https://www.mizuky.com/test/top";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.webView loadRequest:requestObj];
    
    [Jockey on:@"fb-app-event" perform:^(NSDictionary *payload) {
        NSLog(@"\"fb-app-event\" received, payload = %@", payload);
        
        [FBSDKAppEvents logEvent: payload[@"eventName"]
                      valueToSum: [payload[@"valueToSum"] integerValue]
                      parameters: payload[@"parameters"] ];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    return [Jockey webView:webView withUrl:[request URL]];
}

@end
