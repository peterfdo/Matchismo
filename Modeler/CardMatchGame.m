//
//  CardMatchGame.m
//  Matchismo
//
//  Created by Peter Do on 1/29/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "CardMatchGame.h"
#import "Card.h"

@interface CardMatchGame()
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@end

@implementation CardMatchGame

- (NSMutableArray *)cards
{
	if(!_cards)_cards=[[NSMutableArray alloc]init];
	return _cards;
}

-(instancetype) initWithCardCount:(NSUInteger)count
						usingDeck:(Deck *)deck;
{
	self = [super init]; //super's designated initiater
	if (self) {
		for (int i=0; i<count; i++){
			Card *card = [deck drawRandomCard];
			if(card){
			[self.cards addObject:card];
			}else{
				self=nil;
				break;
			}
		}
	}
	return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
	return (index<[self.cards count]) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE	= 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
	int mode = [defaults integerForKey:@"mode"];
	printf("mode retrieved as %d \n",mode);
	
	NSMutableArray *otherCards = [[NSMutableArray alloc] init];
	Card *card = [self cardAtIndex:index];
	
	NSLog(@"%@ Tapped",card.contents);
	self.gameMessage = [NSString stringWithFormat:@"%@ Tapped",card.contents];
	
		if (!card.isMatched){
			NSLog(@"%@ is Not Matched",card.contents);
			if(card.isChosen){
				card.chosen = NO;
				NSLog(@"%@ is unChosen",card.contents);
			}else{
				for (Card *otherCard in self.cards){
					if ((mode==1 && otherCard.isChosen && !otherCard.isMatched && [otherCards count]<2)|
						(mode==0 && otherCard.isChosen && !otherCard.isMatched && [otherCards count]<1)){
						[otherCards addObject:otherCard];
						NSLog(@"%@ added to Compare",otherCard.contents);
						NSLog(@"otherCards has %d cards", [otherCards count]);
					}
				}
				if ((mode==1 && [otherCards count]==2) | (mode==0 && [otherCards count]==1)){
					int matchScore = [card match:otherCards];

					if (matchScore) {
						self.score += matchScore * MATCH_BONUS;
						for (Card *activeCard in otherCards){
							activeCard.matched=YES;
						}
						card.matched=YES;
						
						if(mode==1){
						Card *card1 = [otherCards objectAtIndex:0];
						Card *card2 = [otherCards objectAtIndex:1];
						self.gameMessage = [NSString stringWithFormat:@"%@ %@ %@ Match",card.contents, card1.contents, card2.contents];
						}else{
							Card *card1 = [otherCards objectAtIndex:0];
							self.gameMessage = [NSString stringWithFormat:@"%@ %@ Match",card.contents, card1.contents];
							
						}
					}else{
						self.score -= MISMATCH_PENALTY;
						for (Card *activeCard in otherCards){
							activeCard.chosen=NO;
							NSLog(@"%@ unChosen b/c of No Match",activeCard.contents);
							}
						card.chosen = NO;
						NSLog(@"%@ unChosen b/c of No Match",card.contents);
						
						if(mode==1){
							Card *card1 = [otherCards objectAtIndex:0];
							Card *card2 = [otherCards objectAtIndex:1];
							self.gameMessage = [NSString stringWithFormat:@"%@ %@ %@ Don't Match",card.contents, card1.contents, card2.contents];
						}else{
							Card *card1 = [otherCards objectAtIndex:0];
							self.gameMessage = [NSString stringWithFormat:@"%@ %@ Don't Match",card.contents, card1.contents];
						}
						[otherCards removeAllObjects];
					}
				}
				card.chosen=YES;
				NSLog(@"%@ is Chosen",card.contents);
				self.score-=COST_TO_CHOOSE;
			}
		}
	}
@end
