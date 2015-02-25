//
//  SetCard.h
//  Matchismo
//
//  Created by Peter Do on 2/7/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card
@property (strong, nonatomic) NSString *shape;
@property (nonatomic) CGFloat *alpha;
@property (strong, nonatomic) UIColor *color;
@property (nonatomic) NSUInteger shapeCount;

+(NSArray *)validShapes;
+(NSArray *)validAlphas;
+(NSArray *)validColors;
+(NSArray *)validShapeCount;

@end
