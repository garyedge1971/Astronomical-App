//
//  GESpaceObject.m
//  AstroTime
//
//  Created by Gary Edgcombe on 24/04/2014.
//  Copyright (c) 2014 Gary Edgcombe Code. All rights reserved.
//

#import "GESpaceObject.h"


@implementation GESpaceObject



- (id) init{
    self = [self initWithdata:nil andImage:nil];
    
    return self;
}

-(id)initWithdata:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];
    
    _planetName = [data objectForKey:PLANET_NAME];
    _gravity = [[data objectForKey:PLANET_GRAVITY]floatValue];
    _planetDiameter = [[data objectForKey:PLANET_DIAMETER] intValue];
    _planetYearLength = [[data objectForKey:PLANET_YEAR_LENGTH] floatValue];
    _planetDayLength = [[data objectForKey:PLANET_DAY_LENGTH] floatValue];
    _planetTemp = [[data objectForKey:PLANET_TEMPERATURE] intValue];
    _numOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    _nickName = data[PLANET_NICKNAME];
    _fact = data[PLANET_INTERESTING_FACT];
    _planetPic = image;
    
    return self;
    
}

@end
