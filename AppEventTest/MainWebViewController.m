//
//  ViewController.m
//  AppEventTest
//
//  Created by Kun Wang on 3/4/16.
//  Copyright © 2016 mizuky.com. All rights reserved.
//

#import "MainWebViewController.h"
#import "Jockey.h"

@interface MainWebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation MainWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView.delegate=self;
    NSString *urlAddress = @"https://www.mizuky.com";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [self.webView loadRequest:requestObj];
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
