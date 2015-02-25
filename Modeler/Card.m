//
//  Card.m
//  Matchismo
//
//  Created by Peter Do on 1/27/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int)match:(NSMutableArray *)otherCards
{
	int score = 0;
	
	for (Card *card in otherCards){
		if ([card.contents isEqualToString:self.contents]){
			NSLog(@"%@ and %@ Matched", card.contents, self.contents);
			score =1;
		}
	NSLog(@"%@ and %@ did NOT Match", card.contents, self.contents);
}
	return score;
}

@end
