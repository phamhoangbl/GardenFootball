//
//  LauchViewController.m
//  GardenFootball
//
//  Created by Pham Hoang on 8/1/14.
//  Copyright (c) 2014 Pham Hoang. All rights reserved.
//

#import "LauchViewController.h"
#import "HelperUtils.h"
#import "MainViewController.h"

@interface LauchViewController ()

@end

@implementation LauchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSString* launchImagePath = [HelperUtils getPathSkin];
    launchImagePath = [launchImagePath stringByAppendingString:@"/launch.png"];
    UIImage* image = [UIImage imageWithContentsOfFile:launchImagePath];
    if(image == nil)
    {
        image = [UIImage imageNamed:@"launch_default.png"];
    }
    launchImageView.image = image;
    //Run service get current location
    //end
	[self performSelector:@selector(LaunchScreen) withObject:nil afterDelay:3];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)LaunchScreen
{
    MainViewController* noDataConnectivity = [[UIStoryboard storyboardWithName:@"GardenStoryboard"                                                                                     bundle:nil] instantiateViewControllerWithIdentifier:@"MainViewControllerId"];
    [self.navigationController pushViewController:noDataConnectivity animated:YES];
}

@end
