
#import "MainViewController.h"
#import "SettingsViewController.h"

@interface MainViewController () {
@private
    UIViewController * viewControllerOne_,
    * viewControllerTwo_,
    * viewControllerThree_,
    * viewControllerFour,
    * viewControllerFive;
}

@property (nonatomic, retain) UIViewController * viewControllerOne,
* viewControllerTwo,
* viewControllerThree,
* viewControllerFour,
* viewControllerFive;

@end


@implementation MainViewController

@synthesize viewControllerOne   = viewControllerOne_,
viewControllerTwo   = viewControllerTwo_,
viewControllerThree = viewControllerThree_,
viewControllerFour  = viewControllerFour_,
viewControllerFive  = viewControllerFive_;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override

// Override |KYArcTabViewController|'s |-setup|
- (void)setup {
    // Set View Frame
    self.viewFrame = (CGRect){CGPointZero, {kKYViewWidth, kKYViewHeight}};
    
    // Add child view controllers to each tab
    viewControllerOne_   = [[UIViewController alloc] init];
    viewControllerTwo_   = [[UIViewController alloc] init];
    viewControllerThree_ = [[UIViewController alloc] init];
    viewControllerFour_  = [[UIViewController alloc] init];
    //viewControllerFive_  = [[SettingsViewController alloc] init];
    viewControllerFive_ = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsControllerId"];
    
    // Set child views' Frame
    CGRect childViewFrame = self.viewFrame;
    [viewControllerOne_.view   setFrame:childViewFrame];
    [viewControllerTwo_.view   setFrame:childViewFrame];
    [viewControllerThree_.view setFrame:childViewFrame];
    [viewControllerFour_.view  setFrame:childViewFrame];
    
    // Set child views' background color
    [viewControllerOne_.view   setBackgroundColor:[UIColor blackColor]];
    [viewControllerTwo_.view   setBackgroundColor:[UIColor redColor]];
    [viewControllerThree_.view setBackgroundColor:[UIColor greenColor]];
    [viewControllerFour_.view  setBackgroundColor:[UIColor blueColor]];
    [viewControllerFive_.view  setBackgroundColor:[UIColor darkGrayColor]];
    
    // Add child views as tab bar items
    self.tabBarItems = @[@{@"image"          : [NSString stringWithFormat:kKYITabBarItemImageNameFormat, 1],
                           @"viewController" : viewControllerOne_},
                         @{@"image"          : [NSString stringWithFormat:kKYITabBarItemImageNameFormat, 2],
                           @"viewController" : viewControllerTwo_},
                         @{@"image"          : [NSString stringWithFormat:kKYITabBarItemImageNameFormat, 3],
                           @"viewController" : viewControllerThree_},
                         @{@"image"          : [NSString stringWithFormat:kKYITabBarItemImageNameFormat, 4],
                           @"viewController" : viewControllerFour_},
                         @{@"image"          : [NSString stringWithFormat:kKYITabBarItemImageNameFormat, 5],
                           @"viewController" : viewControllerFive_}];
    
    // Add a gesture signal on the first view
    UIImage * gestureImage = [UIImage imageNamed:kKYIArcTabGestureHelp];
    CGRect gestureImageViewFrame =
    (CGRect){{(kKYViewWidth - gestureImage.size.width) / 2.f,
        (kKYViewHeight - kKYTabBarHeight - gestureImage.size.height) / 2.f},
        gestureImage.size};
    UIImageView * gestureImageView = [[UIImageView alloc] initWithFrame:gestureImageViewFrame];
    [gestureImageView setImage:gestureImage];
    [gestureImageView setUserInteractionEnabled:YES];
    [viewControllerOne_.view addSubview:gestureImageView];
}

@end