//
//  GEDetailViewController.m
//  AstroTime
//
//  Created by Gary Edgcombe on 25/04/2014.
//  Copyright (c) 2014 Gary Edgcombe Code. All rights reserved.
//

#import "GEDetailViewController.h"

@interface GEDetailViewController ()<UIScrollViewDelegate>


@property (weak, nonatomic) IBOutlet UILabel *dPlanetName;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *globalImageView;
@property (weak, nonatomic) IBOutlet UILabel *dGravity;
@property (weak, nonatomic) IBOutlet UILabel *dDiameter;
@property (weak, nonatomic) IBOutlet UILabel *dYearLength;
@property (weak, nonatomic) IBOutlet UILabel *dDayLength;
@property (weak, nonatomic) IBOutlet UILabel *dTemp;
@property (weak, nonatomic) IBOutlet UILabel *dMoons;
@property (weak, nonatomic) IBOutlet UILabel *dNickName;
@property (weak, nonatomic) IBOutlet UILabel *dFact;
@property (weak, nonatomic) IBOutlet UILabel *helperLabel;

@end

@implementation GEDetailViewController

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
    
    self.helperLabel.layer.backgroundColor = [UIColor purpleColor].CGColor;
    self.helperLabel.layer.cornerRadius = 10;
    
    self.scrollView.delegate = self;
    
    
    self.scrollView.contentSize = self.globalImageView.frame.size;
   // self.globalImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    self.globalImageView.image = self.mySpaceObject.planetPic;
    
    
    self.scrollView.minimumZoomScale = 1.0;
    self.scrollView.maximumZoomScale = 3.5;
    
    
    
    self.view.backgroundColor = [UIColor blackColor];
    [self configureView];
}

-(void) fadein
{
    self.helperLabel.alpha = 0;
    self.dFact.alpha = 0;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    //don't forget to add delegate.....
    [UIView setAnimationDelegate:self];
    
    [UIView setAnimationDuration:1.5];
    self.helperLabel.alpha = 1;
    self.dFact.alpha = 1;
    
    //also call this before commit animations......
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView commitAnimations];
}



-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished    context:(void *)context {
    {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:2.0];
        self.helperLabel.alpha = 0;
        [UIView commitAnimations];
    }
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.globalImageView;
}

- (void)configureView
{
    [self fadein];
    
    self.dPlanetName.text = self.mySpaceObject.planetName;
    
    self.dGravity.text = [NSString stringWithFormat:@"%0.2f", self.mySpaceObject.gravity];
    self.dDiameter.text = [NSString stringWithFormat:@"%i", self.mySpaceObject.planetDiameter];
    self.dYearLength.text = [NSString stringWithFormat:@"%0.2f", self.mySpaceObject.planetYearLength];
    self.dDayLength.text = [NSString stringWithFormat:@"%0.2f", self.mySpaceObject.planetDayLength];
    self.dTemp.text = [NSString stringWithFormat:@"%i", self.mySpaceObject.planetTemp];
    self.dMoons.text = [NSString stringWithFormat:@"%i", self.mySpaceObject.numOfMoons];
    self.dNickName.text = [NSString stringWithFormat:@"%@", self.mySpaceObject.nickName];
    self.dFact.text = [NSString stringWithFormat:@"%@",self.mySpaceObject.fact];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
