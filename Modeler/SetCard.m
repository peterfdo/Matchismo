//
//  SetCard.m
//  Matchismo
//
//  Created by Peter Do on 2/7/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(int)match:(NSMutableArray *)otherCards
{
	int score=0;
	
/*
	if ([otherCards count]==1){
		id card = [otherCards firstObject];
		if ([card isKindOfClass:[PlayingCard class]]){
			PlayingCard *otherCard = (PlayingCard *)card;
			if(otherCard.rank==self.rank){
				score=4;
			}else if ([otherCard.suit isEqualToString:self.suit]){
				score=1;
			}
		}
	}else if ([otherCards count]==2){
		NSLog(@"Matching Three Cards");
		PlayingCard *otherCard1 = [otherCards objectAtIndex:0];
		PlayingCard *otherCard2 = [otherCards objectAtIndex:1];
		if(otherCard1.rank==self.rank |
		   otherCard1.rank==self.rank |
		   otherCard1.rank==otherCard2.rank){
			score=2;
		}
		if ([otherCard1.suit isEqualToString:self.suit] |
			[otherCard2.suit isEqualToString:self.suit ] |
			[otherCard1.suit isEqualToString:otherCard2.suit]){
			score+=1;
		}
	}
 */
	return score;
}

@synthesize shape = _shape; //because we defined setter and getter

+ (NSArray *)validShapes
{
	return @[@"◼︎",@"●",@"▲"];
}

- (void) setshape:(NSString *)shape
{
	if ([[SetCard validShapes] containsObject:shape]){
		_shape=shape;
	}
}

-(NSString *)shape
{
	return _shape ? _shape : @"?";
}

@synthesize alpha= _alpha; //because we defined setter and getter

+ (NSArray *)validAlphas
{
	return @[@0,@0.5,@1];
}

- (void) setAlpha:(CGFloat *)alpha
{
		_alpha=alpha;
}

-(CGFloat *)alpha
{
	return _alpha ? _alpha : nil;
}


@synthesize color= _color; //because we defined setter and getter

+ (NSArray *)validColors
{
	return @[[UIColor greenColor],[UIColor blueColor],[UIColor redColor]];
}

- (void) setColor:(UIColor *)color
{
	if ([[SetCard validColors] containsObject:color]){
		_color=color;
	}
}

-(UIColor *)color
{
	return _color ? _color : nil;
}
 
@synthesize shapeCount= _shapeCount; //because we defined setter and getter

+ (NSArray *)validShapeCount
{
	return @[@1,@2,@3];
}

- (void) setShapeCount:(NSUInteger )shapeCount
{
		_shapeCount=shapeCount;
}

@end
