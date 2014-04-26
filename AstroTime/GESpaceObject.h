//
//  GESpaceObject.h
//  AstroTime
//
//  Created by Gary Edgcombe on 24/04/2014.
//  Copyright (c) 2014 Gary Edgcombe Code. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AstronomicalData.h"

@interface GESpaceObject : NSObject

@property (strong, nonatomic) NSString *planetName;
@property (nonatomic) float gravity;
@property (nonatomic) int planetDiameter;
@property (nonatomic) float planetYearLength;
@property (nonatomic) float planetDayLength;
@property (nonatomic) int planetTemp;
@property (nonatomic) int numOfMoons;
@property (strong, nonatomic) NSString *nickName;
@property (strong, nonatomic) NSString *fact;

@property (strong, nonatomic) UIImage *planetPic;


- (id)initWithdata:(NSDictionary *)data andImage:(UIImage *)image;
@end
