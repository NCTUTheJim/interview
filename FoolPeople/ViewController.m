//
//  ViewController.m
//  FoolPeople
//
//  Created by 劉 浚宇 on 2014/8/17.
//  Copyright (c) 2014年 劉 浚宇. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.webView.scrollView.bounces = NO;
    self.webView.scrollView.delegate = self;
    self.webView.scrollView.scrollEnabled = NO;
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://script.google.com/macros/s/AKfycbwIuaNm-xfc7V7lrsaY6E9tX5fULNDaYZ9q6dI2ym6LUMy-OTDi/exec"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    self.label.hidden = YES;
    return YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"%@",webView.request.URL.absoluteString);
//    self.label.hidden = NO;
    if( [webView.request.URL.absoluteString rangeOfString:@"script.google.com/macros"].location!=NSNotFound ) {
        self.label.text = @"如果覺得有趣請分享給朋友";
    }
    else if( [webView.request.URL.absoluteString rangeOfString:@"accounts.google.com/o/oauth2/auth"].location!=NSNotFound ) {
        self.label.text = @"如果不喜歡的話，也請多多包含";
        webView.scrollView.contentOffset = CGPointMake(0,593);
        //        self.secondLabel.hidden = NO;
    }
}

@end
