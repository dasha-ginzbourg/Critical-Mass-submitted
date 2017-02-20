//
//  ViewController.h
//  Critical Mass
//
//  Created by Dasha Ginzbourg on 7/20/14.
//  Copyright (c) 2014 Dasha Ginzbourg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullToRefreshView.h"


@interface ViewController : UIViewController <PullToRefreshViewDelegate>{
    UIWebView *webview;
    int counter;
    IBOutlet UILabel *count;
    int counter2;
    IBOutlet UILabel *count2;
    UIScrollView *currentScrollView;
    
}
@property (nonatomic, retain) IBOutlet

UIWebView *webview;


@property (weak, nonatomic) IBOutlet UILabel *redlabel;
@property (weak, nonatomic) IBOutlet UIButton *redbutton;
@property (weak, nonatomic) IBOutlet UILabel *bluelabel;
@property (weak, nonatomic) IBOutlet UIButton *bluebutton;


- (IBAction)insert:(id)sender;
- (IBAction)insert2:(id)sender;


-(IBAction)functionblue;
-(IBAction)functionred;



@end
