//
//  CardMatchGame.h
//  Matchismo
//
//  Created by Peter Do on 1/29/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchGame : NSObject

//designator initiator
-(instancetype) initWithCardCount:(NSUInteger)count
						usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger)index;

-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSString *gameMessage;

@end
