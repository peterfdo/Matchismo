//
//  PlayingCardGameViewController.m
//  Matchismo
//
//  Created by Peter Do on 2/25/15.
//  Copyright (c) 2015 CS193p. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (Deck *)createDeck
{
	return [[PlayingCardDeck alloc]init];
}

@end
