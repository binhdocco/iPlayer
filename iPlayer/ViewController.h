//
//  ViewController.h
//  iPlayer
//
//  Created by binhdocco on 10/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIWebView() 
    - (void) _setWebGLEnabled: (BOOL)newValue;
@end


@interface ViewController : UIViewController {

    IBOutlet UIWebView *webview;
}

@property(nonatomic, retain) IBOutlet UIWebView *webview;

- (NSString *) getAppPath;

@end
