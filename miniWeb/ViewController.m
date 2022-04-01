//
//  ViewController.m
//  miniWeb
//
//  Created by 김수연 on 2022/03/31.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainWebView, urlText, bookmarkSegmentedControl, activityIndicatorView;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *urlString = @"http://www.facebook.com";
    [mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: urlString]]];
    urlText.text = urlString;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    NSString *urlString = urlText.text;
    if(![urlString hasPrefix:@"http://"]){
        urlString = [[NSString alloc] initWithFormat:@"http://%@", urlString];
    }
    [mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString: urlString]]];
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)bookmarkAction:(id)sender {
    [activityIndicatorView startAnimating];
    NSString *bookmarkURL = [bookmarkSegmentedControl titleForSegmentAtIndex: bookmarkSegmentedControl.selectedSegmentIndex];
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://www.%@.com", bookmarkURL];
    [mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    urlText.text = urlString;
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [activityIndicatorView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [activityIndicatorView stopAnimating];
}


@end
