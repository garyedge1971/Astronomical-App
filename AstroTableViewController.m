//
//  AstroTableViewController.m
//  AstroTime
//
//  Created by Gary Edgcombe on 24/04/2014.
//  Copyright (c) 2014 Gary Edgcombe Code. All rights reserved.
//

#import "AstroTableViewController.h"
#import "GEDetailViewController.h"
#import "GESpaceObject.h"
#import "AstronomicalData.h"


@interface AstroTableViewController ()
@property (strong, nonatomic) NSMutableArray *planets;
//@property (strong, nonatomic) GESpaceObject *spaceObject;
@end

@implementation AstroTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set nav bar to black
    
    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    self.navigationController.navigationBar.titleTextAttributes =@{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    self.planets = [[NSMutableArray alloc] init];
    
    for (NSDictionary *planetData in [AstronomicalData allKnownPlanets]) {
        //get image name from PLANET_NAME
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetData[PLANET_NAME]];
        
        NSLog(@"image name = %@", imageName);
        
        //create SpaceObject instance
        GESpaceObject *aPlanet = [[GESpaceObject alloc]initWithdata:planetData andImage:[UIImage imageNamed:imageName]];
        
        //add to self.planets
        [self.planets addObject:aPlanet];
        
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    GESpaceObject *rowObject = [self.planets objectAtIndex:indexPath.row];
    
    
    cell.backgroundColor = [UIColor blackColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = rowObject.planetName;
    cell.detailTextLabel.text = rowObject.nickName;
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.imageView.image = rowObject.planetPic;

    return cell;
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    //access object at row from Array
//    GESpaceObject *selectedPlanet = [self.planets objectAtIndex:indexPath.row];
//                                     
//    //point our property obj to it
//    self.spaceObject = selectedPlanet;
//    //log it out
//    NSLog(@"selected Planet Name = %@", self.spaceObject.planetName);
//    
//    [self performSegueWithIdentifier:@"manualSegue" sender:self];
//    
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

//    // Get Selected row
//    NSIndexPath *sPath = [self.tableView indexPathForSelectedRow];
//    
//    NSLog(@"selected row = %li", (long)sPath.row);
//    
//    GESpaceObject *selectedSpaceObject = self.planets[sPath.row];
//    detailVC.mySpaceObject = selectedSpaceObject;
    
    //one way is to iterate through Array finding a match for sender
    
    NSLog(@"Sender = %@", [[sender textLabel]text]);
    if ([sender isKindOfClass:[UITableViewCell class]]) {
        
        if ([[segue destinationViewController] isKindOfClass:[GEDetailViewController class]]) {
            // Get the new view controller using [segue destinationViewController].
            GEDetailViewController *detailVC = [segue destinationViewController];
            NSIndexPath *iPath = [self.tableView indexPathForCell:sender];
            detailVC.mySpaceObject = self.planets[iPath.row];
        }
    }
}

@end
