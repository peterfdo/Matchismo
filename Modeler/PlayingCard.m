//
//  PlayingCard.m
//  Matchismo
//
//  Created by Peter Do on 1/27/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(int)match:(NSMutableArray *)otherCards
{
	int score=0;
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
	return score;
}


-(NSString *)contents
{
	NSArray *rankStrings = [PlayingCard rankStrings];
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; //because we defined setter and getter

+ (NSArray *)validSuits
{
	return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}

- (void) setSuit:(NSString *)suit
{
	if ([[PlayingCard validSuits] containsObject:suit]){
		_suit=suit;
	}
}

-(NSString *)suit
{
	return _suit ? _suit : @"?";
}

+(NSArray *)rankStrings
{
	return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSUInteger)maxRank {return [[self rankStrings]count]-1;}

-(void)setRank:(NSUInteger)rank
{
	if(rank <= [PlayingCard maxRank]){
		_rank = rank;
	}
}

@end