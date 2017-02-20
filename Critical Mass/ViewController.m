//
//  ViewController.m
//  Critical Mass
//
//  Created by Dasha Ginzbourg on 7/20/14.
//  Copyright (c) 2014 Dasha Ginzbourg. All rights reserved.
//

//
//  ViewController.m
//  Critical Mass
//
//  Created by Dasha Ginzbourg on 7/20/14.
//  Copyright (c) 2014 Dasha Ginzbourg. All rights reserved.
//

#import "ViewController.h"
#import "PullToRefreshView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize webview;

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *myURL = @"***Replace with your own URL ex:http://www.website.com***/CriticalMass/index.php";
    NSURL *url= [NSURL URLWithString:myURL];
    [webview loadRequest:[NSURLRequest requestWithURL:url]];
    webview.scrollView.bounces = NO;
    webview.opaque = NO;
    webview.backgroundColor = [UIColor colorWithRed:0.557 green:0.557 blue:0.51 alpha:1]; /*#8e8e82*/

    
    
    
    counter=0;
    
    count.text = @"0";
    
    counter2=0;
    
    count2.text = @"0";
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    
    _redbutton.layer.borderWidth = .55f;
    _redbutton.layer.borderColor = [[UIColor grayColor] CGColor];
    _redbutton.layer.backgroundColor = [[UIColor redColor] CGColor];
    _redbutton.layer.cornerRadius = 75;
    
    _bluebutton.layer.borderWidth = .55f;
    _bluebutton.layer.borderColor = [[UIColor grayColor] CGColor];
    _bluebutton.layer.backgroundColor = [[UIColor blueColor] CGColor];
    _bluebutton.layer.cornerRadius = 75;
    
    
    
    [webview setDelegate:self];
    webview.tag = 999;
    
    for (UIView* subView in webview.subviews) {
        if ([subView isKindOfClass:[UIScrollView class]]) {
            currentScrollView = (UIScrollView *)subView;
            currentScrollView.delegate = (id) self;
        }
    }
    
    
    // Set up Pull to Refresh code
    PullToRefreshView *pull = [[PullToRefreshView alloc] initWithScrollView:currentScrollView];
    [pull setDelegate:self];
    pull.tag = 998;
    [currentScrollView addSubview:pull];
    [self.view addSubview:webview];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)functionblue {
    
    counter=counter + 1;
    
    count.text = [NSString stringWithFormat:@"%i",counter];
    
}




- (IBAction)functionred{
    counter2=counter2 + 1;
    
    count2.text = [NSString stringWithFormat:@"%i",counter2];
}
- (IBAction)insert:(id)sender
{
    //UIButton *btn = (UIButton*) sender;
    // create string contains url address for php file, the file name is phpFile.php, it receives parameter :name
    NSString *strURL = [NSString stringWithFormat:@"***Replace with your own URL ex:http://www.website.com***/phpFile2.php?selection=1"];
    
    // to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    // to receive the returend value
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", strResult);
}
- (IBAction)insert2:(id)sender
{
    //UIButton *btn = (UIButton*) sender;
    // create string contains url address for php file, the file name is phpFile.php, it receives parameter :name
    NSString *strURL = [NSString stringWithFormat:@"***Replace with your own URL ex:http://www.website.com***/phpFile2.php?selection=2"];
    
    // to execute php code
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    // to receive the returend value
    NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", strResult);
}

-(void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view {
    [(UIWebView *)[self.view viewWithTag:999] reload];
}

- (void)webViewDidFinishLoad:(UIWebView *)wv
{
    [(PullToRefreshView *)[self.view viewWithTag:998] finishedLoading];
}

@end
