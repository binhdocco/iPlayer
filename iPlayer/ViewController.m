//
//  ViewController.m
//  iPlayer
//
//  Created by binhdocco on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize webview;


- (NSString *) getAppPath {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"app_data"];
    //path = [path stringByAppendingString:@"/app_path/"];
    return path;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    webview.allowsInlineMediaPlayback = TRUE;
	webview.mediaPlaybackRequiresUserAction = FALSE;
    
    //enable webgl
    @try {
        id webDoc = [webview performSelector: @selector(_browserView)];
        id bwv = [webDoc performSelector: @selector(webView)];
        [bwv _setWebGLEnabled: YES];
        
    } @catch(NSException *e) {
        NSLog(@"WebGL not supported.");
    }
    //end enable
    
    NSString *url = [self getAppPath];
    //url = [url stringByAppendingString:@"index.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:url] cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval: 10.0];
     
    [webview loadRequest:request];
    NSLog(@"appPath: %@", url);
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.webview = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft ||
        interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        return YES;
    }
    return NO;
}

@end
